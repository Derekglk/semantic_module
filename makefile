CC=gcc
CFLAGS=-c -Wall
CFLAGS+=`pkg-config --cflags libcjson`
LDFLAGS=`pkg-config --libs libcjson`
SOURCES=json_parser.c
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=json_parser

.PHONY: default
default: all

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(OBJECTS) -o $@ $(LDFLAGS)

.c.o:
	echo $(CFLAGS)
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -f *.o $(EXECUTABLE)