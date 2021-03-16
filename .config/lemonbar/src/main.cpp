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

// define global variables
int lemonin[2];
char * desktops = new char[1024];
char * windowname = new char[64];

void sigint_handler(int){
  write(2, "ending", 6);
  _exit(0);
}

#include "network.h"
#include "time.h"
#include "asyncmodules.h"

int main(){
  // register signal handlers
  signal(SIGINT, sigint_handler);

  // open the pipe
  pipe(lemonin);
  int pid = fork();
  if(pid == 0){
    dup2(lemonin[0], 0);
    execlp("lemonbar", "lemonbar", "-fmononoki-Regular Nerd Font Complete Mono",
        "-B#2E3440", "-F#D8DEE9", "-U#88C0D0",
        "-u1", "-gx20", "-o3", "-p");
  }
  dup2(lemonin[1], 1);

  rx_bytes_fd = open("/sys/class/net/wlp2s0/statistics/rx_bytes", O_RDONLY);
  tx_bytes_fd = open("/sys/class/net/wlp2s0/statistics/tx_bytes", O_RDONLY);

  // async modules
  signal(SIGUSR1, DesktopModule);
  signal(SIGUSR2, WindowModule);
  memset(desktops, 0, 1024);
  memset(windowname, 0, 64);
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
