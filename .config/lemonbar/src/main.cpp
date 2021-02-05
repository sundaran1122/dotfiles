#include <unistd.h>
#include <fcntl.h>
#include <signal.h>
#include <stdlib.h>
#include <stdio.h>
#include <iostream>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/wait.h>

// define global variables
int lemonin;
char * desktops = new char[1024];

#include "network.cpp" 
#include "desktop.cpp"

void sigint_handler(int){
  write(2, "ending", 6);
  _exit(0);
}

int main(){
  // register signal handlers
  signal(SIGINT, sigint_handler);

  // open the pipe
  lemonin = open("/tmp/wm/lemonbar", O_WRONLY | O_NONBLOCK);
  dup2(lemonin, 1);

  rx_bytes_fd = open("/sys/class/net/enp0s3/statistics/rx_bytes", O_RDONLY);
  tx_bytes_fd = open("/sys/class/net/enp0s3/statistics/tx_bytes", O_RDONLY);

  // async modules
  signal(SIGUSR1, DesktopModule);
  memset(desktops, 0, 1024);
  kill(getpid(), SIGUSR1);

  for(;;){
    printf(desktops);

    // right aligned modules
    printf("%{r}");
    NetworkModule();
    fflush(stdout);
    sleep(1);
  }
}
