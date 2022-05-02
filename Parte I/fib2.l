/* Definitions */
%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    int number, is_fib, a, b, seq;
    char *token;
    const char delim[1] = ",";

    int number_is_fib(int n);
    void head();
    void print_result(int result);
%}

digits          [0-9]
/* End Definitions */

/*--------------------------------------------------------------------------*/

/* Rules */
%%
-{digits}+ {
    printf("Negative number is invalid!\n");
}

{digits}+.{digits}+ {
    printf("Only positive integers are valid!\n");
}

^{digits}+$ {
    number = atoi(yytext);
    is_fib = number_is_fib(number);

    printf("\nDoes the number below occur in the Fibonacci sequence?\n\n");
    print_result(is_fib);
}

(?:{digits}+,)+{digits}+$ {
    token = strtok(yytext, delim);

    printf("\nDo the numbers below occur in the Fibonacci sequence?\n\n");
    while (token != NULL) {
        number = atoi(token);
        is_fib = number_is_fib(number);
        print_result(is_fib);
        token = strtok(NULL, delim);
    }
}

quit|q|exit {
    printf("-------------------------------------------------- EXITING... --------------------------------------------------\n");
    exit(1);
}

. ;
%%
/* End Rules */

/*--------------------------------------------------------------------------*/

int number_is_fib(int n) {
    seq = 0;
    a = 0;
    b = 1;

    if (n == a || n == b)
        return 1;
    
    seq = a + b;
    while(seq <= n && is_fib == 0) {
        if (seq == n)
            return 1;
        
        a = b;
        b = seq;
        seq = a + b;
    }
    
    return 0;
}

void head(){
    printf("---------------------------------------------------------------------------------------------------------------\n");
    printf("--------------------------------------------------------- WELCOME!! -------------------------------------------\n");
    printf("---------------------------------------------------------------------------------------------------------------\n");
    printf("--> INSTRUCTIONS: ---------------------------------------------------------------------------------------------\n");
    printf("\t -> To evaluate a positive integer, type it and then press ENTER \n");
    printf("\t -> To evaluate more than one positive integer, type each one separated by a comma and then press ENTER \n");
    printf("\t -> To exit the application, you can type exit, q, or quit \n");
    printf("--------------------------------------------------- ENJOY!! ---------------------------------------------------\n");
}

void print_result(int result) {
    printf("%*.*d", 24, 1, number);
    if (is_fib == 1)
        printf(" - Yes\n");
    else
        printf(" - No\n");
}

int main() {
    head();
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}