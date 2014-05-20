/* Copyright (GPL) 2004 mchirico@users.sourceforge.net or mchirico@comcast.net

  Simple lemon parser  example.
  Downloads: http://prdownloads.sourceforge.net/souptonuts/lemon_examples.tar.gz?download

  See the Makefile, as most all of this is done automatically.
  

*/

%token_type {int}  
   
%left PLUS MINUS.   
%left DIVIDE TIMES.  
   
%include {   
#include <stdio.h>  
#include "example1.h"
#ifndef YYERRORSYMBOL //2014-may lemon.c
#include <assert.h>
#endif
}  
   
%syntax_error {  
  printf("Syntax error!\n");
}   
   
program ::= expr(A).   { printf("Result=%d\n", A); /*2004: double %%*/ }  
   
expr(A) ::= expr(B) MINUS  expr(C).  { A = B - C; }  
expr(A) ::= expr(B) PLUS   expr(C).  { A = B + C; }  
expr(A) ::= expr(B) TIMES  expr(C).  { A = B * C; }  
expr(A) ::= expr(B) DIVIDE expr(C).  { 

         if(C != 0){
           A = B / C;
         }else{
           printf("divide by zero\n");
         }
}  /* end of DIVIDE */

expr(A) ::= INTEGER(B). { A = B; } 
