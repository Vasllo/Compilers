/* Definitions */
%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "nzeromum.tab.h"
%}
/* End Definitions */

%option noyywrap
/*--------------------------------------------------------------------------*/

/* Rules */

%%

0 { 
    return ZERO;
}

1 {
    return UM; 
}

quit|q|Q|exit {
    printf("-------------------------------------------------- EXITING... --------------------------------------------------\n");
    exit(0);
}



%%
/* End Rules */

/*--------------------------------------------------------------------------*/