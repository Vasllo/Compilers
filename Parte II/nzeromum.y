/* Definitions */
%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    void head();

    void yyerror(char *c);
    int yylex(void);
%}
/* End Definitions */
%token ZERO UM

%start stmt
/*--------------------------------------------------------------------------*/

/* Rules */
%%

stmt: A {
        printf("\nSequence Accepted\n\n"); 
        exit(0);
    };

A:  ZERO A UM
    | ZERO B UM
    ;

B:  UM B ZERO
    | UM ZERO
    ;

%%
/* End Rules */

/*--------------------------------------------------------------------------*/

void yyerror(char *s)
{
    printf("\nSequence Rejected\n");
}

void head(){
    printf("---------------------------------------------------------------------------------------------------------------\n");
    printf("--------------------------------------------------------- WELCOME!! -------------------------------------------\n");
    printf("---------------------------------------------------------------------------------------------------------------\n");
    printf("--> INFO: ---------------------------------------------------------------------------------------------\n");
    printf("\t -> This program evaluates whether the string follows the rule:   \n");
    printf("\t\t -> 0^n 1^m 0^m 1^n (without spaces) | n, m >= 1   \n");
    printf("--> INSTRUCTIONS: ---------------------------------------------------------------------------------------------\n");
    printf("\t -> To evaluate a string with 0s and 1s, type it and then press ENTER \n");
    printf("\t -> To exit the application, you can type exit, q, or quit \n");
    printf("--------------------------------------------------- ENJOY!! ---------------------------------------------------\n");
}

int main()
{
    head();
    yyparse();
    return 0;
}