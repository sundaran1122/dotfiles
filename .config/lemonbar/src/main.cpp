#include <unistd.h>
#include <fcntl.h>
#include <signal.h>
#include <stdlib.h>
#include <stdio.h>
#include <iostream>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

#define MODULE_START printf("%%{B#3B4252}%%{+u} ")
#define MODULE_END printf(" %%{B-}%%{-u}")

// define global variables
int lemonin;
char * desktops = new char[1024];
char * windowname = new char[32];
char * temp = new char[32];

#include "helpers.cpp"
#include "network.cpp" 
#include "asyncmodules.cpp"

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
    LoadModule("/home/sundaran/.scripts/lemonbar/datemodule.zsh", temp, 32);
    printf(temp);
    
    // right aligned modules
    printf("%{r}");
    NetworkModule();

    printf("  ");
    MODULE_START;
    LoadModule("/home/sundaran/.scripts/lemonbar/timemodule.zsh", temp, 32);
    printf(temp);
    MODULE_END;

    printf("  \n");
    fflush(stdout);
    sleep(1);
  }
}
