#include <stdio.h>
#include <string.h>

int main (){
        int a,b;
        char sign;
        scanf("%d %d",&a,&b);
        scanf (" %c",&sign);

switch (sign) {
        case    '-':
                        printf("Result of (b - a) using my_extern_sub = %d\n", my_extern_sub(a,b));
                        break;
        case    '+':
                        printf("Result of (b + a) using my_extern_add = %d\n", my_extern_add(a,b));
                        break;
        case    '*':
                        printf("Result of (b * a) using my_extern_mul = %d\n", my_extern_mul(a,b));
                        break;
        case    '/':
                        printf("Result of (b / a) using my_extern_div = %d\n", my_extern_div(a,b));
                        break;

        }
        return 0;
}

