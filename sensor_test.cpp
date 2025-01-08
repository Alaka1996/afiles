#include <gtest/gtest.h>
#include "sensor.h"  // Include the sensor.h header for the calculate_average function

// Test Case 1: Test `calculate_average` with normal data
TEST_F(SensorTest, CalculateAverageNormalDataTest) {
    // Fill the data array with known values
    sensor_data[0] = 10;
    sensor_data[1] = 20;
    sensor_data[2] = 30;
    sensor_data[3] = 40;
    sensor_data[4] = 50;
    sensor_data[5] = 60;
    sensor_data[6] = 70;
    sensor_data[7] = 80;
    sensor_data[8] = 90;
    sensor_data[9] = 100;

    // Calculate the average using the function
    int average = calculate_average(sensor_data, size);

    // Assert the expected average: (10 + 20 + ... + 100) / 10 = 55
    ASSERT_EQ(average, 55);
}
