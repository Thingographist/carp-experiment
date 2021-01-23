#include <stdio.h>
#include "vendor/libdill-2.14/libdill.h"

coroutine void worker() {
   printf("is alive!\n");
}

void GO_call() {
    go(worker());
}