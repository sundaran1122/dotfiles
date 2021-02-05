void DesktopModule(int){
  int output[2];
  pipe(output);

  int pid = fork();
  if(pid == 0){
    dup2(output[1], 1);
    execlp("bash", "bash", "/home/sundaran/.scripts/lemonbar/desktopmodule.sh");
  }

  wait(0);
  memset(desktops, 0, 64);
  read(output[0], desktops, 64);
  close(output[0]);
  close(output[1]);
  return;
}
