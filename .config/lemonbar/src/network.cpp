int rx_bytes, tx_bytes;
int rx_bytes_fd, tx_bytes_fd;
int rx_prev_bytes, tx_prev_bytes;
char rx_bytes_str[32];
char tx_bytes_str[32];

void NetworkModule(){
  lseek(rx_bytes_fd, 0, SEEK_SET);
  lseek(tx_bytes_fd, 0, SEEK_SET);

  read(rx_bytes_fd, rx_bytes_str, 32);
  read(tx_bytes_fd, tx_bytes_str, 32);

  rx_bytes = atoi(rx_bytes_str);
  tx_bytes = atoi(tx_bytes_str);

  MODULE_START;
  printf(" v %.2fK ", (rx_bytes - rx_prev_bytes)/1000.0);
  printf("%{B-} ");
  MODULE_START;
  printf(" ^ %.2fK ", (tx_bytes - tx_prev_bytes)/1000.0);

  rx_prev_bytes = rx_bytes;
  tx_prev_bytes = tx_bytes;

  MODULE_END;
}
