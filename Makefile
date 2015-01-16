# Version
VERSION = 1.2014.5

ifeq (0,1)
this Makefile require GNU make!
TODO: zkusit antimake?
endif

# Compiler flags
CFLAGS = -W -O2 -s -pipe
CFLAGS += -Wall

CLMFLAGS = -Wall -W -O2 -s -pipe -lm
LFLAGS =  -O2 -s -pipe

examples = $(addprefix example,1 2 3 4 5)

default : example5

all : $(examples)

lemon : lemon.c
	$(CC) $(CFLAGS) -o $@ lemon.c


example%.c : lemon

$(addsuffix .y,$(examples)) : lemon

%.c : %.y
	  ./lemon $<

example1_SRC = example1.c example1_main.c
example1 : $(example1_SRC)
	$(CC) $(CFLAGS) -o $@ $(LFLAGS) $@.c $@_main.c && ./$@

example2_SRC = example2.c example2_main.c
example2 : $(example2_SRC)
	$(CC) $(CFLAGS) -o $@ $(LFLAGS) $@.c $@_main.c && ./$@

example3_SRC = example3.c example3_main.c
example3 : $(example3_SRC)
	$(CC) $(CFLAGS) -o $@ $($@_SRC) && ./$@

example4_SRC = example4.c example4_main.c
example4 : $(example4_SRC)
	$(CC) $(CFLAGS) -o $@ $($@_SRC) && ./$@


example5_SRC = example5.c example5_main.c lexer5.c
example5 : $(example5_SRC)
	$(CC) $(CFLAGS) -o $@ $($@_SRC) && ./$@

lexer5.c : lexer.l lexglobal.h
	flex lexer.l && mv lex.yy.c lexer5.c


dcalc: desktop_calc.cc
	  g++ -o $@ $(CLMFLAGS)  $<

clean:	
	rm  -f  -- example?.[ch] lexer.c *.o lemon $(examples) dcalc a.out *.out
	rm -f -- *.[ch].txt c2dw

ch.txt : $(addsuffix .txt,$(wildcard *.[ch]))
%.c.txt : %.c ; ./c2dw $< > $@
%.h.txt : %.h ; ./c2dw $< > $@


FORCE :: ;
