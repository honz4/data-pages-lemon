
struct Token {
  const char *z; 
  int value;
  unsigned n;
};

///Poznámka: netřeba v C++, viz [[c:c-cpp]], to udělá implicitní [[c:typedef]]
typedef struct Token Token;
