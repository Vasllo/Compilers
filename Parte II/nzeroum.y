/* Definitions */
%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    
    char *word;
    int n_zero = 0;
    int n_um = 0;
    int is_equal = 0;

    void inc_ns();
    void cat_word_1(int n1);
    void cat_word_2(int n1, int n2);
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
stmt: A EOL {
    print_result(n_um == n_zero);
}
A:  ZERO A UM { 
        cat_word_2($1, $3); 
        inc_ns(); 
    }
    | UM A ZERO { 
        cat_word_2($1, $3); 
        inc_ns(); 
    }
    | UM { 
        cat_word_1($1); 
        n_um++; 
    }
    | ZERO { 
        cat_word_1($1); 
        n_zero++; 
    }
    |
    ;


%%
/* End Rules */

/*--------------------------------------------------------------------------*/

void yyerror(char *s)
{
    printf("ERROR -> %s\n", s);
}

void inc_ns(){
    n_zero++;
    n_um++;
}

void cat_word_1(int n1){
    char n1_c = n1 + '0';

    strncat(word, &n1_c, 1);
}

void cat_word_2(int n1, int n2){
    char n1_c = n1 + '0';
    char n2_c = n2 + '0';

    strncat(word, &n1_c, 1);
    strncat(word, &n2_c, 1); 
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
    if (is_equal == 1)
        printf(" - Yes\n");
    else
        printf(" - No\n");
}

int main()
{
    yyparse();
    return 0;
}