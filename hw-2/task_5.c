
#include <stdio.h>
int intsum(int *a, int n);
float floatsum(float *f, int n);
int main()
{
int i;
int n = 5;
int *a = (int *)malloc(n*sizeof(int));
float *f = (float *)malloc(n*sizeof(float));
for (i=0; i<5; i++)
scanf("%d", &a[i]);
printf("%d\n", intsum(a, n));
for (i=0; i<5; i++)
scanf("%f", &f[i]);
printf("%.2f\n", floatsum(f, n));

return 0;
}
