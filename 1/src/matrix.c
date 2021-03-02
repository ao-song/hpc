#include <stdio.h>
#include "matrix.h"

void mul_matrix(int n, void* c, void* a, void* b) {
    double *ret, *arg1, *arg2;
    ret = (double *)c;
    arg1 = (double *)a;
    arg2 = (double *)b;

    double sum = 0;

    for (int row = 0; row < n; row++) {
        for (int col = 0; col < n; col++) {
            for (int i = 0; i < n; i++) {
                sum += arg1[row*n+i] * arg2[i*n+col];
            }
            ret[row*n+col] = sum;
            sum = 0;
        }
    }
}
