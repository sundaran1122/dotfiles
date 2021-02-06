void DesktopModule(int){
  LoadModule("/home/sundaran/.scripts/lemonbar/desktopmodule.zsh" , desktops, 1024);
  kill(getpid(), SIGUSR2);
}

void WindowModule(int){
 LoadModule("/home/sundaran/.scripts/lemonbar/windownamemodule.zsh", windowname, 32);
}
