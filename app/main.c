#include <stdio.h>
#include "add.h"
#include "add_2.h"
#include "sub.h"
#include "say_hi.h"
#include "mul.h"
#include "autoconf.h"

int main(void) {
#if defined(CONFIG_SAY_HI)
	say_hi();
#endif /* defined(CONFIG_SAY_HI) */

#if defined(CONFIG_ADD)
	printf("2 + 2 = %d\n", add(2, 2));
#endif /* defined(CONFIG_ADD) */
#if defined(CONFIG_ADD_2)
	printf("2 + 2 = %d\n", add_2(2));
#endif /* defined(CONFIG_ADD_2) */

#if defined(CONFIG_MUL)
	printf("2 * 3 = %d\n", mul(2, 3));
#endif /* defined(CONFIG_MUL) */

	printf("2 - 2 = %d\n", sub(2, 2));

	return 0;
}
