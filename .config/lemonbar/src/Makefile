CC=g++

%.o: %.cpp
	$(CC) -c $<

all: main.o asyncmodules.o helpers.o time.o network.o
	$(CC) -s -O2 -o ../controllemonbar $^
