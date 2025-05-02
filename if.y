
// File: ifelse.y
%{
#include <stdio.h>
#include <stdlib.h>
%}

%token IF ELSE LPAREN RPAREN LBRACE RBRACE ASSIGN ADD SUB MUL DIV GT LT GE LE EQ NE ID NUMBER SEMICOLON
%left ADD SUB
%left MUL DIV

%%

program:
      if_stmt        { printf("Valid if-else statement\n"); }
    ;

if_stmt:
      IF LPAREN condition RPAREN LBRACE stmt_list RBRACE else_part_opt
    ;

else_part_opt:
      /* empty */
    | ELSE LBRACE stmt_list RBRACE
    ;

condition:
      ID LT NUMBER
    | ID GT NUMBER
    | ID LE NUMBER
    | ID GE NUMBER
    | ID EQ NUMBER
    | ID NE NUMBER
    ;

stmt_list:
      stmt_list statement
    | statement
    ;

statement:
      ID ASSIGN expression SEMICOLON
    | if_stmt          /* allow nested ifs */
    ;

expression:
      ID
    | NUMBER
    | expression ADD expression
    | expression SUB expression
    | expression MUL expression
    | expression DIV expression
    ;

%%

void yyerror(const char *msg) {
    fprintf(stderr, "Invalid parsing failed\n");
}

int main() {
    return yyparse();
}
