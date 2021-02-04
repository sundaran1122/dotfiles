#include <sys/types.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

int rx_bytes, tx_bytes;
int rx_prev_bytes = 0;
int tx_prev_bytes = 0;
char rx_bytes_str[32];
char tx_bytes_str[32];
int rx_bytes_fd, tx_bytes_fd;
int length = 0;

void NetworkModule(){
  lseek(rx_bytes_fd, 0, SEEK_SET);
  lseek(tx_bytes_fd, 0, SEEK_SET);
  read(rx_bytes_fd, rx_bytes_str, 32);
  read(tx_bytes_fd, tx_bytes_str, 32);
  rx_bytes = atoi(rx_bytes_str);
  tx_bytes = atoi(tx_bytes_str);
  length += snprintf(buffer + length, 256, "v %.2fK ", (rx_bytes - rx_prev_bytes)/1000.0);
  length += snprintf(buffer + length, 256, "^ %.2fK", (tx_bytes - tx_prev_bytes)/1000.0);
  rx_prev_bytes = rx_bytes;
  tx_prev_bytes = tx_bytes;
}
