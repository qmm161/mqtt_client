#include "msg_queue.h"
#include "fifo.h"
#include <mdm/macro.h>
#include <mdm/log.h>

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
    CHECK_DO_RTN_VAL(!body, LOG_WARN("Failed to parse msg!"), NULL);

    mqtt_msg *msg = (mqtt_msg *)calloc(1, sizeof(mqtt_msg));
    CHECK_DO_RTN_VAL(!msg, LOG_WARN("No memory!"); cJSON_Delete(body), NULL);

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
        }
        child = child->next;
    }
    cJSON_DetachItemViaPointer(body, msg->body);
    cJSON_Delete(body);
    CHECK_DO_GOTO(!mqtt_msg_is_valid(msg), LOG_WARN("Failed to parse msg!"), INVALID_MSG);
    return msg;

INVALID_MSG:
    LOG_INFO("Invalid mqtt message");
    free_mqtt_msg(msg);
    return NULL;
}

int msg_init_queue()
{
    msg_queue = salof_fifo_create(MAX_MSG_CNT);
    CHECK_DO_RTN_VAL(!msg_queue, LOG_WARN("No memory!"), -1);

    return 0;
}

int msg_enqueue(mqtt_msg *msg)
{
    unsigned int len = salof_fifo_write(msg_queue, (void *)&msg, sizeof(mqtt_msg *), MSG_QUEUE_TIMEOUT);
    CHECK_DO_RTN_VAL(len == 0, LOG_WARN("Failed to enqueue msg!"), -1);

    LOG_INFO("Succ to enqueue msg with len: %d - %lld", (int)len, (long long)msg);
    return 0;
}

mqtt_msg *msg_dequeue()
{
    mqtt_msg *msg = NULL;
    unsigned int len = salof_fifo_read(msg_queue, &msg, sizeof(mqtt_msg *), MSG_QUEUE_TIMEOUT);
    CHECK_RTN_VAL(len == 0, NULL);

    LOG_INFO("Succ to dequeue msg with len: %d - %lld", (int)len, (long long)msg);
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
