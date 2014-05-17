//y = Axxx + Bxx + Cx + D

#include <stdio.h>
#include "drawme.h"

double init(double x){
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
double previous_der[100] = {0};
double der[100] = {0};
double h, t;

scanf("%d", &N);
h = 2.0 / N;    
t = (k * h) / Cx;

M = 2.0 / (Cx * t)+1; // amount of steps

int i;


for (i = 0; i < N; i++) {
  x[i] = (i * h) - 1;
y[i] = previous_y[i] = init (x[i]);
        };


double A, B, C, D, tg, b;

int j = 0;

while (j < M) {

for (i = 1; i < N; i++) {
D = y[i];
C = der[i];
A = (((previous_der[i-1] - C)/h) + 2 * (previous_y[i-1] - D + C * h)/(h*h))/h;
B = (previous_y[i-1] - D + C * h)/(h*h) + A*h;

y[i] = A * (-Cx*t) * (-Cx*t) * (-Cx*t) + B * (-Cx*t) * (-Cx*t) + C * (-Cx*t) + D;
der[i] = 3 * A * (-Cx*t) * (-Cx*t) + 2 * B * (-Cx*t) + C; 
};


    
                D = y[0];
                C = der[0];
                A = (((previous_der[N - 1] - C)/h) + 2 * (previous_y[N-1] - D + C * h)/(h*h))/h;
                B = (previous_y[N-1] - D + C * h)/(h*h) + A*h;

                y[0] = A * (-Cx*t) * (-Cx*t) * (-Cx*t) + B * (-Cx*t) * (-Cx*t) + C * (-Cx*t) + D;
                der[0] = 3 * A * (-Cx*t) * (-Cx*t) + 2 * B * (-Cx*t) + C;


        for (i = 0; i < N; i++){
                previous_y[i] = y[i];
previous_der[i] = der[i];
        }
j++;
}
//build plot

        DM_plot_1d(x, y, N, "Test 1", 0);
        DM_plot_1d(x, y, N, "Test 1", 1);

return 0;
}
