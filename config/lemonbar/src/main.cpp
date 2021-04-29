#include <fcntl.h>
#include <signal.h>
#include <sys/types.h>
#include <unistd.h>
#include <X11/Xlib.h>

#include <iostream>

#include "network.h"
#include "time.h"
#include "asyncmodules.h"

extern char * desktops;
extern char * windowname;
extern Display * dpy;

// generic signal handler
void sigint_handler(int){
  write(2, "ending", 6);
  _exit(0);
}

int main(){
	dpy = XOpenDisplay(0);

  // register signal handlers
  signal(SIGINT, sigint_handler);

	// open some file descriptors
  rx_bytes_fd = open("/sys/class/net/wlp2s0/statistics/rx_bytes", O_RDONLY);
  tx_bytes_fd = open("/sys/class/net/wlp2s0/statistics/tx_bytes", O_RDONLY);

  // async modules
  signal(SIGUSR1, DesktopModule);
  signal(SIGUSR2, WindowModule);
	DesktopModule(SIGUSR1);
	WindowModule(SIGUSR1);

  for(;;){
		std::cout << " "
    << desktops
    << " "
    << windowname;

    // center aligned modules
    std::cout << "%{c}";
    TimeModule();

    // right aligned modules
		std::cout << "%{r}";
    NetworkModule();

		std::cout << " \n";
		std::cout.flush();
    sleep(1);
  }
}
