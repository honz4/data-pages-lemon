
#include "ex2def.h"
#include "example2.h"
#include <stdlib.h> //malloc() free()

int main(void) {
  void* pParser = ParseAlloc (malloc);

  struct Token t0,t1;
  struct Token mToken;

  t0.value=4;
  t0.n=0;

  t1.value=13;
  t1.n=0;

  Parse (pParser, NUM, t0);
  Parse (pParser, PLUS, t0);
  Parse (pParser, NUM, t1);
  Parse (pParser, 0, t0);


  Parse (pParser, NUM, t0);
  Parse (pParser, MINUS, t0);
  Parse (pParser, NUM, t1);
  Parse (pParser, 0, t0);

  Parse (pParser, NUM, t0);
  Parse (pParser, TIMES, t0);
  Parse (pParser, NUM, t1);
  Parse (pParser, PLUS, t0);
  Parse (pParser, NUM, t1);
  Parse (pParser, PLUS, t0);
  Parse (pParser, NUM, t1);
  Parse (pParser, 0, t0);

  ParseFree(pParser, free );

}
