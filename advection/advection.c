#include <stdio.h>
#include <math.h>

int main (){
int N=10;
int M=1;
double h=2.0/N;
printf ("%f\n",h);
int Cx=1;
double k=0.6;
double t=k*h/Cx;

int now [N+1];
double  next [N+1];

double x1=-0.5;
double x2=0.5;
int i;
for (i=0;i<N+1; i++){
        if (((-1+i*h)<=x1) || ((i*h-1)>=x2))
                now[i]=0;
        else
                now[i]=1;
        }
now [N+1]=now[0];
for (i=0;i<=N;i++)
        printf ("%d " ,now[i]);

next[0]=(now[1]-now[0])*(h-Cx*t)/h;
for (i=0;i<N-1; i++)
        if ((next[i]==0) && (now[i+2]==0))
                next[i+1]=0;
        else
                next[i+1]=abs(now[i+2]-next[i])*((h-Cx*t)/h);

for (i=0;i<N;i++)
        printf ("%f " ,next[i]);
return 0;
}

