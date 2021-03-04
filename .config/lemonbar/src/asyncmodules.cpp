void DesktopModule(int){
  LoadModule("/home/sundaran/.scripts/lemonbar/desktopmodule.bash" , desktops, 1024);
  kill(getpid(), SIGUSR2);
}

void WindowModule(int){
 LoadModule("/home/sundaran/.scripts/lemonbar/windownamemodule.bash", windowname, 64);
}
