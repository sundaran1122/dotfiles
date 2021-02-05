void DesktopModule(int){
  int output[2];
  pipe(output);

  int pid = fork();
  if(pid == 0){
    dup2(output[1], 1);
    execlp("zsh", "zsh", "/home/sundaran/.scripts/lemonbar/desktopmodule.zsh");
  }
  wait(0);

  memset(desktops, 0, 1024);
  read(output[0], desktops, 1024);
  close(output[0]);
  close(output[1]);
  return;
}
