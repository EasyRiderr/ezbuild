#include <stdio.h>
#include "autoconf.h"

int say_hi(void) {
	printf("Hello %s !\n", CONFIG_SAY_HI_TO);

	return 0;
}


static int print_wished_warning(int unused) {
	return 0;
}
