#include <stdlib.h> //malloc() free()

#include "ex3def.h"
#include "example3.h"

int main(void) {
  void* pParser = ParseAlloc (malloc);

  struct Token t0,t1;
  struct Token mToken;

  t0.value=4;
  t0.n=0;

  t1.value=13;
  t1.n=0;

  printf(" t0.value=4  PLUS t1.value=13\n");

  Parse (pParser, NUM, t0);
  Parse (pParser, PLUS, t0);
  Parse (pParser, NUM, t1);
  Parse (pParser, 0, t0);

  printf(" t0.value=4  DIVIDE t1.value=13\n");

  Parse (pParser, NUM, t0);
  Parse (pParser, DIVIDE, t0);
  Parse (pParser, NUM, t1);
  Parse (pParser, 0, t1);

  printf(" t0.value=4  TIMES  t1.value= 13 PLUS t0.value=4 PLUS t1.value=13\n");

  Parse (pParser, NUM, t0);
  Parse (pParser, TIMES, t0);
  Parse (pParser, NUM, t1);
  Parse (pParser, PLUS, t0);
  Parse (pParser, NUM, t1);
  Parse (pParser, PLUS, t0);
  Parse (pParser, NUM, t1);
  Parse (pParser, 0, t1);

  printf(" t1.value=13  PLUS  t0.value=4\n");

  Parse (pParser, NUM, t1);
  Parse (pParser, PLUS, t1);
  Parse (pParser, NUM, t0);
  Parse (pParser, 0, t1);

  ParseFree(pParser, free );

}
