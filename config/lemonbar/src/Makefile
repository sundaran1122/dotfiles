CC=g++ 
LIBS=-lX11

%.o: %.cpp
	$(CC) -O3 -c $<

all: main.o asyncmodules.o helpers.o time.o network.o temp.o
	$(CC) $^ $(LIBS) -o ../controllemonbar
