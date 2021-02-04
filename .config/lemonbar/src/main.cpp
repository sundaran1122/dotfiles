#include <unistd.h>
#include <fcntl.h>
#include <signal.h>
#include <stdlib.h>
#include <stdio.h>
#include <iostream>
#include <sys/mman.h>
#include <sys/stat.h>

void sigint_handler(int){
  write(1, "ending", 6);
  _exit(0);
}

// define global variables
int lemonpipe[2];
char * buffer = new char[256];
int length = 0;

#include "network.cpp"

int main(){
  // register signal handlers
  signal(SIGINT, sigint_handler);

  // open the pipe
  pipe(lemonpipe);

  // fork
  int pid = fork();
  if(pid == 0) { // so we are in the child
    dup2(lemonpipe[0], 0);
    close(lemonpipe[1]);
    execlp("lemonbar", "lemonbar", "-gx32", "-B#2E3440", "-F#ECEFF4", "-", 0);
  }

  rx_bytes_fd = open("/sys/class/net/enp0s3/statistics/rx_bytes", O_RDONLY);
  tx_bytes_fd = open("/sys/class/net/enp0s3/statistics/tx_bytes", O_RDONLY);

  for(;;){
    length = 0;
    write(lemonpipe[1], "\n", 1);

    // right aligned modules
    length += snprintf(buffer + length, 256, "%{r}");
    NetworkModule();

    write(lemonpipe[1], buffer, 256);
    sleep(1);
  }
}
