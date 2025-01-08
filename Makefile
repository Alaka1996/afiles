# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -std=c11

# Project files
TARGET = sensor_program
SRC = main.c sensor.c
OBJ = $(SRC:.c=.o)

# Default target
all: $(TARGET)

# Link object files to create the executable
$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

# Compile each .c file into a .o file
%.o: %.c sensor.h
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up compiled files
clean:
	rm -f $(OBJ) $(TARGET)

# Run the program
run: $(TARGET)
	./$(TARGET)
