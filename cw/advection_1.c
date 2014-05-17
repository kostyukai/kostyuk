#include <stdio.h>
#include "drawme.h"

double f(double x){
if (x >= -0.5 && x <= 0.5) {
return 1;
}
return 0;
};


int main(){

const double Cx = 1;
const double k = 0.5;

int N, M;
double x[100] = {0};
double y[100] = {0};
double previous_y[100] = {0};
double tg,b;

double h, t;

scanf("%d", &N);
h = 2.0 / N;
t = (k * h) / Cx;

M = 2.0 / (Cx * t)+1; // among of steps
printf("M = %d\n", M);
int i;


for (i = 0; i < N; i++) {
  x[i] = (i * h) - 1;
y[i] = previous_y[i] =f(x[i]);

        };
int j = 0;

while (j < M) {

for (i = 1; i < N; i++) {
tg = (y[i] - previous_y[i-1]) / h;
b = y[i] - tg * x[i];
y[i] = tg * (x[i] - Cx * t) + b;
};

//for zero nod
        tg = (y[0] - previous_y[N-1]) / h;
        y[0] = (h - Cx * t) * tg + previous_y[N-1];


        for (i = 0; i < 100; i++){
                previous_y[i] = y[i];
        }

j++;
}
//draw plot

        DM_plot_1d(x, y,  N, "Test 1", 0);
       DM_plot_1d(x, y,  N, "Test 1", 1);


for (i = 0; i < N; i++) {
 printf ("%lf ",y[i]);
}
return 0;
}

