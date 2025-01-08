# Compiler and flags
CC = g++
CFLAGS = -Wall -Wextra -std=c++11 -I./include
LDFLAGS = -lgtest -lgtest_main -pthread

# Project files
TARGET = sensor_program
SRC = src/sensor.c main.c
OBJ = $(SRC:.c=.o)

# Test files
TEST_SRC = test/sensor_test.cpp
TEST_OBJ = $(TEST_SRC:.cpp=.o)
TEST_TARGET = test

# Default target
all: $(TARGET)

# Link object files to create the executable
$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

# Compile each .c file into a .o file
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Build and run the tests
test: $(TEST_OBJ) $(OBJ)
	$(CC) $(CFLAGS) $(TEST_OBJ) $(OBJ) -o $@ $(LDFLAGS)
	./$(TEST_TARGET)

# Compile test files into .o files
%.o: %.cpp
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up compiled files
clean:
	rm -f $(OBJ) $(TEST_OBJ) $(TARGET) $(TEST_TARGET)
