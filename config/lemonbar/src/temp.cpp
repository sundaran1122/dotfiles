#include <string.h>
#include <unistd.h>
#include <iostream>

#include "helpers.h"

int temperature_fd;

void TempModule() {
	char buf[16];
	long temp;

  lseek(temperature_fd, 0, SEEK_SET);
	read(temperature_fd, buf, 16);
	temp = atol(buf);

	MODULE_START;
	std::cout << temp / 1000.0 << "\xc2\xb0" "C" ;
	MODULE_END;
}
