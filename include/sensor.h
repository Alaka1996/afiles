// sensor.h
#ifndef SENSOR_H
#define SENSOR_H

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>


#define BUFFER_SIZE 10

// Function prototypes
void read_sensor_data(uint16_t *data);
int calculate_average(const uint16_t *data, int size);
void print_data(const uint16_t *data, int size);
void process_data(const uint16_t *data);

#endif // SENSOR_H
