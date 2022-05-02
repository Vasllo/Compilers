/* Definitions */
%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "nzeroum.tab.h"

    extern int yylval;
%}
/* End Definitions */

/*--------------------------------------------------------------------------*/

/* Rules */

%%
0 {
    yylval=0; 
    return ZERO;
}

1 {
    yylval=1; 
    return UM; 
}

\n {
    return EOL;
}

quit|q|exit {
    printf("-------------------------------------------------- EXITING... --------------------------------------------------\n");
    exit(1);
}

. ;

%%
/* End Rules */

/*--------------------------------------------------------------------------*/