#include "msg_queue.h"
#include "fifo.h"
#include "mqtt_log.h"

#define MAX_MSG_CNT 20
#define MSG_QUEUE_TIMEOUT 2

static salof_fifo_t msg_queue = NULL;

void free_mqtt_msg(mqtt_msg *msg)
{
    if (msg)
    {
        free(msg->topic);
        cJSON_Delete(msg->body);
        free(msg);
    }
}

mqtt_msg *malloc_mqtt_msg(const char *topic, const char *payload)
{
    mqtt_msg *msg = (mqtt_msg *)calloc(1, sizeof(mqtt_msg));
    if (msg)
    {
        msg->topic = strdup(topic);
        msg->body = cJSON_Parse(payload);
        if (!msg->topic || !msg->body)
        {
            MQTT_LOG_I("Invalid mqtt message");
            free_mqtt_msg(msg);
            msg = NULL;
        }
    }
    return msg;
}

int msg_init_queue()
{
    msg_queue = salof_fifo_create(MAX_MSG_CNT);
    if (!msg_queue)
    {
        MQTT_LOG_I("No memory!");
        return -1;
    }
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