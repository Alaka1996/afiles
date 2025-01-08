# Compiler and flags
CC = g++
CFLAGS = -Wall -Wextra -std=c++11 -I./include
GTEST_DIR = /path/to/googletest    # Path to Google Test source code or installed location
GTEST_LIB = $(GTEST_DIR)/build/libgtest.a  # The static library of Google Test

# Project files
TARGET = sensor_program
SRC = src/sensor.c main.c
OBJ = $(SRC:.c=.o)
TEST_SRC = test/sensor_test.cpp  # Path to your test source file
TEST_OBJ = $(TEST_SRC:.cpp=.o)

# Default target
all: $(TARGET)

# Link object files to create the executable
$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

# Compile each .c file into a .o file
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Compile the test file
test: $(TEST_OBJ) $(OBJ)
	$(CC) $(CFLAGS) -o test_runner $(TEST_OBJ) $(OBJ) $(GTEST_LIB) -pthread

# Run the program
run: $(TARGET)
	./$(TARGET)

# Run the tests
test_run: test
	./test_runner

# Clean up compiled files
clean:
	rm -f $(OBJ) $(TARGET) $(TEST_OBJ) test_runner

# Cppcheck target for static analysis
cppcheck:
	mkdir -p cppcheck_reports
	cppcheck --enable=all --inconclusive --quiet --force $(SRC) $(TEST_SRC) > cppcheck_reports/report.txt

# Combined check target to run cppcheck and then build
check: cppcheck all
