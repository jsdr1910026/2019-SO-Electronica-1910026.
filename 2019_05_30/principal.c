#include <stdio.h>
#include "entero.h"

int main(int argc, char** argv) {
  entero a,b;

  a = 8;
  b = 4;
  printf("la suma de %d + %d es %d\n",a,b,suma(a,b));
  printf("la resta de %d - %d es %d\n",a,b,resta(a,b));
  printf("la multiplicacion de %d x %d es %d\n",a,b,multi(a,b));
  printf("la division de %d / %d es %f\n",a,b,(float)division(a,b));
  
}

