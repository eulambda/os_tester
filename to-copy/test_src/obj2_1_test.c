#include "param.h"
#include "types.h"
#include "stat.h"
#include "user.h"
#include "syscall.h"
#include "traps.h"
#include "memlayout.h"
#include "fcntl.h"

#pragma GCC diagnostic ignored "-Wunused-variable"
int allocate_only()
{
	volatile char stack[1024 * 8];
	return frees();
}
#pragma GCC diagnostic pop
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
int allocate_and_assign()
{
	volatile char stack[1024 * 8];
	for (int i = 0; i < 1024 * 8; i += 4096)
	{
		stack[i] = 'A';
	}
	return frees();
}
#pragma GCC diagnostic pop
int main(void)
{
	// #6 - stack demand paging
	int init_frees, after_frees, touch_frees;

	init_frees = frees();
	printf(1, "=== Check initial frees : %d ===\n", init_frees);

	after_frees = allocate_only();
	printf(1, "=== Check after allocating frees : %d ===\n", after_frees);

	touch_frees = allocate_and_assign();
	printf(1, "=== Check touch frees : %d ===\n", touch_frees);

	if (init_frees - after_frees == 0 && init_frees - touch_frees != 0)
	{
		printf(1, "==== Stack demand paging success ====\n");
	}
	else
	{
		printf(1, "**** Stack demand paging failure ****\n");
	}

	exit();
}
