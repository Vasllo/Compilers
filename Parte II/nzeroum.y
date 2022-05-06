/* Definitions */
%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    
    char word[] = "\0";
    int n_zero = 0;
    int n_um = 0;

    void cat_word_1(int n1);
    void head();
    void print_result(int result);

    void yyerror(char *c);
    int yylex(void);
%}
/* End Definitions */
%token ZERO UM EOL
/*--------------------------------------------------------------------------*/

/* Rules */
%%

stmnt: A EOL {printf("Deu bom\n");} | {printf("Deu ruim\n");}

A: ZERO UM |;


/*',' {
    printf("Passou linha A1\n");
    print_result($$);
    word[0] = '\0';
    n_zero = 0;
    n_um = 0; 
}
| ZERO A { 
    printf("Passou linha A2\n");
    cat_word_1($1); 
    n_zero++;
    $$ = n_um == n_zero;
}
| UM A { 
    printf("Passou linha A3\n");
    cat_word_1($1); 
    n_um++;
    $$ = n_um == n_zero;
}
|
EOL {
    printf("Passou linha A4\n");
    print_result($$);
}*/

%%
/* End Rules */

/*--------------------------------------------------------------------------*/

void yyerror(char *s)
{
    printf("ERROR -> %s\n", s);
}

void cat_word_1(int n1){
    printf("Passou linha 80. n1=%d\n", n1);
    char n1_c = n1 + '0';
    printf("Passou linha 82. n1=%c *word=%s\n", n1_c, word);

    strcat(word, &n1_c);
    printf("Passou linha 85. word=%s sizeof(word)=%lu\n", word, sizeof(word));
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
    printf("%*.*s", 24, 1, word);
    if (result == 1)
        printf(" - Yes\n");
    else
        printf(" - No\n");
}

int main()
{
    #ifdef YYDEBUG
    yydebug = 1;
    #endif
    head();
    yyparse();
    return 0;
}