void LoadModule(char * modulepath, char * buffer, int size){
  int output[2];
  pipe(output);

  int pid = fork();
  if(pid == 0){
    dup2(output[1], 1);
    execlp("zsh", "zsh", modulepath);
  }
  wait(0);

  memset(buffer, 0, size);
  read(output[0], buffer, size);
  close(output[0]);
  close(output[1]);
  return;
}
