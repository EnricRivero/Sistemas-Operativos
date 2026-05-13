#include <stdio.h>
const int MAX = 3;

int main () {

   int  var[] = {10, 100, 200};
   int  i, *ptr;

   /* let us have array address in pointer */
   ptr = var;
        
   for ( i = 0; i < MAX; i++) {

      printf("Address of var[%d] = %lx\n", i, (unsigned long) &var[i]);
      printf("Value of ptr for iteration %d is %lx\n", i, (unsigned long) ptr);

      /* move to the next location */
      ptr++;
   }
        
   return 0;
}
