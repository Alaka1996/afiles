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

# Clean up compiled files
clean:
	rm -f $(OBJ) $(TARGET)

# Run the program
run: $(TARGET)
	./$(TARGET)

# Cppcheck target for static analysis
cppcheck:
    mkdir -p cppcheck_reports
    cppcheck --enable=all --inconclusive --quiet --force --suppress=missingInclude $(SRC) > cppcheck_reports/report.txt


# Combined check target to run cppcheck and then build
check: cppcheck all
