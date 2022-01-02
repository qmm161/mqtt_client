/*
 * @Author: jiejie
 * @Github: https://github.com/jiejieTop
 * @Date: 2019-12-11 21:53:07
 * @LastEditTime: 2020-06-08 20:45:33
 * @Description: the code belongs to jiejie, please keep the author information and source code according to the license.
 */
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <pthread.h>

#include <mdm/data_repo.h>
#include <mdm/macro.h>

#include "mqtt_config.h"
#include "mqtt_log.h"
#include "mqttclient.h"
#include "msg_queue.h"

#include <string.h>

//===========================================================================
//线程控制
int var = 100;
pthread_t tid;

static mqtt_client_t *client = NULL;
static int quit = 0;

//===========================================================================
// #define TEST_USEING_TLS
extern const char *test_ca_get();

void *MplayerRtmp(void *arg)
{
    char *cmd = (char *)arg;
    system(cmd);
    free(cmd);
    pthread_exit(NULL); //可以用
    return NULL;
}

static int play_audio(cJSON *input)
{
    cJSON *url = input->child;
    if (strcmp("url", url->string))
    {
        MQTT_LOG_W("invalid play audio msg.");
        return -1;
    }

    struct mdd_node *node = NULL;
    int rt = repo_get("Data/Audio/Volumn", &node);
    if (rt)
    {
        MQTT_LOG_W("Failed to get volumn para");
        return rt;
    }

    char *cmd = (char *)calloc(1, 250);
    snprintf(cmd, 250, "/root/play.sh %lld %s", int_leaf_val(node), url->valuestring);
    pthread_create(&tid, NULL, MplayerRtmp, (void *)cmd);
    return 0;
}

static int stop_play_audio(cJSON *input)
{
    (void)input;
    pthread_cancel(tid);
    system("killall mplayer");
    return 0;
}

static int set_data(cJSON *input)
{
    (void)input;

    return 0;
}

static int handler_mqtt_msg(mqtt_msg *msg)
{
    int rt = 0;
    if (!strcmp(msg->msg_name, "PlayAudio"))
    {
        rt = play_audio(msg->body);
    }
    else if (!strcmp(msg->msg_name, "StopAudio"))
    {
        rt = stop_play_audio(msg->body);
    }
    else if (!strcmp(msg->msg_name, "Set"))
    {
        rt = set_data(msg->body);
    }

    return rt;
}

static int
mdm_repo_init(char *ws)
{
    char model_path[100];
    char data_path[100];

    strncpy(model_path, ws, 99);
    strncat(model_path, "/model.json", 100 - strlen(model_path) - 1);
    strncpy(data_path, ws, 99);
    strncat(data_path, "/data.json", 100 - strlen(data_path) - 1);
    return repo_init(model_path, data_path);
}

static void msg_receiver(void *client, message_data_t *msg)
{
    (void)client;
    MQTT_LOG_I("-----------------------------------------------------------------------------------");
    MQTT_LOG_I("%s:%d %s()...\ntopic: %s\nmessage:%s", __FILE__, __LINE__, __FUNCTION__, msg->topic_name, (char *)msg->message->payload);
    MQTT_LOG_I("-----------------------------------------------------------------------------------");

    mqtt_msg *mq_msg = malloc_mqtt_msg(msg->topic_name, (const char *)msg->message->payload);
    CHECK_DO_RTN(!mq_msg, MQTT_LOG_W("Failed to build mqtt_msg!"));

    int rt = msg_enqueue(mq_msg);
    if (rt)
    {
        MQTT_LOG_W("Failed to enqueue mqtt_msg!");
        free_mqtt_msg(mq_msg);
    }
}

static int mqtt_subscribe_type_topic(char *buf, size_t buf_len, const char *type_name, const char *types, const char *def_type)
{
    if (types)
    {
        size_t len = strlen(types);
        char *buf = strdup(types);
        CHECK_DO_RTN_VAL(!buf, MQTT_LOG_W("No memory"), -1);

        char *begin = buf;
        char *cur = begin;
        while (cur && begin)
        {
            if (*cur == '|')
            {
                *cur = '\0';
                snprintf(buf, buf_len, "vc100/bcast/%s/%s", type_name, begin);
                MQTT_LOG_I("subscribe topic: %s", buf);
                mqtt_subscribe(client, buf, QOS0, msg_receiver);

                begin = cur + 1;
            }
            cur++;
        }

        if (begin)
        {
            snprintf(buf, buf_len, "vc100/bcast/%s/%s", type_name, begin);
            MQTT_LOG_I("subscribe topic: %s", buf);
            mqtt_subscribe(client, buf, QOS0, msg_receiver);
        }

        free(buf);
    }

    snprintf(buf, buf_len, "vc100/bcast/%s/%s", type_name, def_type);
    MQTT_LOG_I("subscribe topic: %s", buf);
    mqtt_subscribe(client, buf, QOS0, msg_receiver);

    return 0;
}

static int subscribe_topics()
{
    char buf[512];
    struct mdd_node *node = NULL;

    int rt = repo_get("Data/DevId", &node);
    CHECK_DO_RTN_VAL(rt || !node, MQTT_LOG_W("Failed to get devid"), -1);
    char *devid = str_leaf_val(node);
    snprintf(buf, 512, "vc100/cmd/%s", devid);
    MQTT_LOG_I("subscribe topic: %s", buf);
    mqtt_subscribe(client, buf, QOS0, msg_receiver);

    repo_get("Data/Types", &node);
    rt = mqtt_subscribe_type_topic(buf, 512, "type", node ? str_leaf_val(node) : NULL, "all");
    CHECK_DO_RTN_VAL(rt, MQTT_LOG_W("Failed to subscribe type topic"), -1);

    repo_get("Data/Areas", &node);
    rt = mqtt_subscribe_type_topic(buf, 512, "area", node ? str_leaf_val(node) : NULL, "all");
    CHECK_DO_RTN_VAL(rt, MQTT_LOG_W("Failed to subscribe area topic"), -1);

    return 0;
}

static int mqtt_client_init()
{
    client = mqtt_lease();
    /*
#ifdef TEST_USEING_TLS
    mqtt_set_port(client, "8883");
    mqtt_set_ca(client, (char*)test_ca_get());
#else
    mqtt_set_port(client, "1883");
#endif

    mqtt_set_host(client, "www.jiejie01.top");
    mqtt_set_client_id(client, random_string(10));
    mqtt_set_user_name(client, random_string(10));
    mqtt_set_password(client, random_string(10));
	*/
    mqtt_set_port(client, "1883");
    mqtt_set_host(client, "192.168.1.100");
    mqtt_set_client_id(client, "123456|securemode=3,signmethod=hmacsha1|");

    mqtt_set_clean_session(client, 1);

    mqtt_connect(client);

    subscribe_topics();
    return 0;
}

int main(int argc, char **argv)
{
    mqtt_log_init();

    if (argc < 2)
    {
        MQTT_LOG_W("Lack para: repo dir!");
        return 0;
    }

    MQTT_LOG_I("\nwelcome to mqttclient test...\n");

    int rt = msg_init_queue();
    MQTT_LOG_I("init msg queue with rlt:%d", rt);

    rt = mdm_repo_init(argv[1]);
    MQTT_LOG_I("init repo with rlt:%d", rt);

    rt = mqtt_client_init();
    MQTT_LOG_I("init mqtt client rlt:%d", rt);

    while (!quit)
    {
        mqtt_msg *msg = msg_dequeue();
        if (msg)
        {
            MQTT_LOG_I("dequeue msg with topic:%s", msg->topic);
            rt = handler_mqtt_msg(msg);
            MQTT_LOG_I("handler mqtt msg rlt:%d", rt);
            free_mqtt_msg(msg);
        }
    }
    return 0;
}
