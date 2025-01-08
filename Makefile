# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -std=c11 -I./include

# Project files
TARGET = sensor_program
SRC = src/sensor.c main.c
OBJ = $(SRC:.c=.o)

# Default target
all: $(TARGET)

# Link object files to create the executable
$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

# Compile each .c file into a .o file
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Static analysis with cppcheck
cppcheck:
	cppcheck --enable=all --inconclusive --force --quiet --error-exitcode=1 .

# Clean up compiled files
clean:
	rm -f $(OBJ) $(TARGET)

# Run the program
run: $(TARGET)
	./$(TARGET)
