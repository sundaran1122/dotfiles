#include <unistd.h>

// define the pipe
int lemonpipe[2];
pipe(lemonpipe);

#include "module.cpp"

int main(){
  // fork
  int pid = fork();
  if(pid == 0) { // so we are in the child
    dup2(lemonpipe[0], 0);
    close(lemonpipe[1]);
    execlp("lemonbar", "lemonbar", "-gx32", "-B#2E3440", "-", 0);
  }
  for(;;){
  }
}
