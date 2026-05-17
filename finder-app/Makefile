CC = gcc
CROSS_COMPILE ?=
CFLAGS = -Wall -Werror

all: writer

writer: writer.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) -o writer writer.c

clean:
	rm -f writer
