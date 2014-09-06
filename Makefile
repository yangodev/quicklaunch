SHELL = /bin/sh
SRCDIR = src
OBJDIR = obj
CC = g++
CFLAGS = -std=c++11 -Wall -I. `pkg-config --cflags gtkmm-3.0`
LDLIBS = -lpthread `pkg-config --libs gtkmm-3.0`
SOURCES = $(wildcard $(SRCDIR)/*.cpp)
OBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=$(OBJDIR)/%.o)
EXECUTABLE = quicklaunch

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDLIBS) $(OBJECTS) -o $@

$(OBJDIR)/%.o : $(SRCDIR)/%.cpp
	$(CC) $(CFLAGS) -g -c $< -o $@

clean:
	rm -f $(EXECUTABLE) $(OBJDIR)/*
