CC = gcc
CFLAGS = -Wall -Wextra -std=c11 -Iinclude
LDFLAGS =
SRC = src/sensor.c main.c
OBJ = $(SRC:.c=.o)
EXEC = sensor_program

.PHONY: all clean cppcheck

all: $(EXEC)

$(EXEC): $(OBJ)
	$(CC) $(LDFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

cppcheck:
	cppcheck --enable=all --inconclusive --force --quiet --error-exitcode=1 \
	--suppress=missingIncludeSystem -Iinclude $(SRC)

clean:
	rm -f $(OBJ) $(EXEC)
