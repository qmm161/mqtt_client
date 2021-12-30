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

void *MplayerRtmp(void *arg)
{
    system("/root/play.sh 200 rtmp://192.168.1.100:1935/live/home");
    pthread_exit(NULL); //可以用
    return NULL;
}

//===========================================================================
// #define TEST_USEING_TLS
extern const char *test_ca_get();

static void topic1_handler(void *client, message_data_t *msg)
{
    (void)client;
    MQTT_LOG_I("-----------------------------------------------------------------------------------");
    MQTT_LOG_I("%s:%d %s()...\ntopic: %s\nmessage:%s", __FILE__, __LINE__, __FUNCTION__, msg->topic_name, (char *)msg->message->payload);
    MQTT_LOG_I("-----------------------------------------------------------------------------------");

    pthread_create(&tid, NULL, MplayerRtmp, NULL);
}

static void topic2_handler(void *client, message_data_t *msg)
{
    (void)client;
    MQTT_LOG_I("-----------------------------------------------------------------------------------");
    MQTT_LOG_I("%s:%d %s()...\ntopic: %s\nmessage:%s", __FILE__, __LINE__, __FUNCTION__, msg->topic_name, (char *)msg->message->payload);
    MQTT_LOG_I("-----------------------------------------------------------------------------------");

    pthread_cancel(tid);
    system("killall mplayer");
}

static void topic3_handler(void *client, message_data_t *msg)
{
    (void)client;
    MQTT_LOG_I("-----------------------------------------------------------------------------------");
    MQTT_LOG_I("%s:%d %s()...\ntopic: %s\nmessage:%s", __FILE__, __LINE__, __FUNCTION__, msg->topic_name, (char *)msg->message->payload);
    MQTT_LOG_I("-----------------------------------------------------------------------------------");

    system("ps");
}

static int mdm_repo_init(char *ws)
{
    char *model_path[100];
    char *data_path[100];

    strncpy(model_path, sizeof(model_path), ws);
    strncat(model_path, "/model.json", 100 - strlen(model_path) - 1);
    strncpy(data_path, sizeof(data_path), ws);
    strncat(data_path, "/data.json", 100 - strlen(data_path) - 1);
    return repo_init(model_path, data_path);
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

    mqtt_subscribe(client, "topic1-1", QOS0, topic1_handler);
    mqtt_subscribe(client, "topic2-1", QOS0, topic2_handler);
    mqtt_subscribe(client, "topic3-1", QOS2, topic3_handler);

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
        //main loop
    }
    return 0;
}
