#include "msg_queue.h"
#include "fifo.h"
#include "mqtt_log.h"
#include <mdm/macro.h>

#define MAX_MSG_CNT 20
#define MSG_QUEUE_TIMEOUT 2

static salof_fifo_t msg_queue = NULL;

void free_mqtt_msg(mqtt_msg *msg)
{
    if (msg)
    {
        free(msg->topic);
        free(msg->msg_id);
        free(msg->msg_name);
        cJSON_Delete(msg->body);
        free(msg);
    }
}

static int mqtt_msg_is_valid(mqtt_msg *msg)
{
    return msg && msg->topic && msg->msg_id && msg->msg_name && msg->body ? 1 : 0;
}

mqtt_msg *malloc_mqtt_msg(const char *topic, const char *payload)
{
    cJSON *body = cJSON_Parse(payload);
    CHECK_DO_RTN_VAL(!body, MQTT_LOG_W("Failed to parse msg!"), NULL);

    mqtt_msg *msg = (mqtt_msg *)calloc(1, sizeof(mqtt_msg));
    CHECK_DO_RTN_VAL(!msg, MQTT_LOG_W("No memory!"); cJSON_Delete(body), NULL);

    msg->topic = strdup(topic);
    cJSON *child = body->child;
    while (child)
    {
        if (!strcmp(child->string, "msg_id"))
        {
            msg->msg_id = strdup(child->valuestring);
        }
        else if (!strcmp(child->string, "msg_name"))
        {
            msg->msg_name = strdup(child->valuestring);
        }
        else if (!strcmp(child->string, "msg_body"))
        {
            msg->body = child;
            cJSON_DetachItemViaPointer(child, child);
        }
        child = child->next;
    }
    cJSON_Delete(body);
    CHECK_DO_GOTO(!mqtt_msg_is_valid(msg), MQTT_LOG_W("Failed to parse msg!"), INVALID_MSG);
    return msg;

INVALID_MSG:
    MQTT_LOG_I("Invalid mqtt message");
    free_mqtt_msg(msg);
    return NULL;
}

int msg_init_queue()
{
    msg_queue = salof_fifo_create(MAX_MSG_CNT);
    if (!msg_queue)
    {
        MQTT_LOG_I("No memory!");
        return -1;
    }
    return 0;
}

int msg_enqueue(mqtt_msg *msg)
{
    unsigned int len = salof_fifo_write(msg_queue, (void *)msg, sizeof(mqtt_msg *), MSG_QUEUE_TIMEOUT);
    if (len == 0)
    {
        MQTT_LOG_I("Failed to enqueue msg!");
        return -1;
    }
    return 0;
}

mqtt_msg *msg_dequeue()
{
    mqtt_msg *msg = NULL;
    unsigned int len = salof_fifo_read(msg_queue, &msg, sizeof(mqtt_msg *), MSG_QUEUE_TIMEOUT);
    if (len == 0)
    {
        return NULL;
    }
    return msg;
}

int msg_full()
{
    return salof_fifo_write_able(msg_queue) ? 0 : 1;
}

int msg_empty()
{
    return salof_fifo_read_able(msg_queue) ? 1 : 0;
}