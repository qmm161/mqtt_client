#ifndef _MSG_QUEUE_H_
#define _MSG_QUEUE_H_

#include <stdlib.h>
#include <cjson/cJSON.h>

typedef struct
{
    char *topic;
    cJSON *body;
} mqtt_msg;

void free_mqtt_msg(mqtt_msg *msg);
mqtt_msg *malloc_mqtt_msg(const char *topic, const char *payload);

int msg_init_queue();
int msg_enqueue(mqtt_msg *msg);
mqtt_msg *msg_dequeue();
int msg_full();
int msg_empty();

#endif