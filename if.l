%{
#include "y.tab.h"
%}

%option noyywrap

%%
[ \t\r\n]+             ;            /* skip whitespace */
"if"                  { return IF; }
"else"                { return ELSE; }
"("                   { return LPAREN; }
")"                   { return RPAREN; }
"{"                   { return LBRACE; }
"}"                   { return RBRACE; }
";"                   { return SEMICOLON; }
"="                   { return ASSIGN; }
"<="                  { return LE; }
">="                  { return GE; }
"<"                   { return LT; }
">"                   { return GT; }
"=="                  { return EQ; }
"!="                  { return NE; }
"+"                   { return ADD; }
"-"                   { return SUB; }
"*"                   { return MUL; }
"/"                   { return DIV; }

[0-9]+                 { return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]*  { return ID; }

.                      { fprintf(stderr, "Unknown char: %s\n", yytext); exit(1); }

%%
