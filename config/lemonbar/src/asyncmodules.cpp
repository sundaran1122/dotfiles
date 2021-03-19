#include <unistd.h>
#include <signal.h>

#include "helpers.h"

extern char * desktops;
extern char * windowname;

void DesktopModule(int){
  LoadModule("/home/sundaran/.scripts/lemonbar/desktopmodule.bash" , desktops, 1024);
  kill(getpid(), SIGUSR2);
}

void WindowModule(int){
 LoadModule("/home/sundaran/.scripts/lemonbar/windownamemodule.bash", windowname, 64);
}
