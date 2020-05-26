#include <stdio.h>
#include "add.h"
#include "add_2.h"
#include "sub.h"
#include "say_hi.h"
#include "mul.h"

int main(void) {
	say_hi();

	printf("2 + 2 = %d\n", add(2, 2));
	printf("2 + 2 = %d\n", add_2(2));

	printf("2 * 3 = %d\n", mul(2, 3));

	printf("2 - 2 = %d\n", sub(2, 2));

	return 0;
}
