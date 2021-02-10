#include <unistd.h>
#include <fcntl.h>
#include <signal.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <iostream>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <string.h>
#include <unistd.h>

#define MODULE_START printf("%%{B#3B4252}%%{+u} ")
#define MODULE_END printf(" %%{B-}%%{-u}")

// define global variables
int lemonin[2];
char * desktops = new char[1024];
char * windowname = new char[32];

#include "helpers.cpp"
#include "network.cpp" 
#include "asyncmodules.cpp"
#include "time.cpp"

void sigint_handler(int){
  write(2, "ending", 6);
  _exit(0);
}

int main(){
  // register signal handlers
  signal(SIGINT, sigint_handler);

  // open the pipe
  pipe(lemonin);
  int pid = fork();
  if(pid == 0){
    dup2(lemonin[0], 0);
    execlp("lemonbar", "lemonbar", "-fMononoki",
        "-B#2E3440", "-F#D8DEE9", "-U#88C0D0",
        "-u2", "-gx25", "-p");
  }
  dup2(lemonin[1], 1);

  rx_bytes_fd = open("/sys/class/net/enp0s3/statistics/rx_bytes", O_RDONLY);
  tx_bytes_fd = open("/sys/class/net/enp0s3/statistics/tx_bytes", O_RDONLY);

  // async modules
  signal(SIGUSR1, DesktopModule);
  signal(SIGUSR2, WindowModule);
  memset(desktops, 0, 1024);
  memset(windowname, 0, 32);
  kill(getpid(), SIGUSR1);
  kill(getpid(), SIGUSR2);

  for(;;){
    printf("  ");
    printf(desktops);
    printf("  ");
    printf(windowname);

    // center aligned modules
    printf("%{c}");
    TimeModule();
    
    // right aligned modules
    printf("%{r}");
    NetworkModule();

    printf("  \n");
    fflush(stdout);
    sleep(1);
  }
}
