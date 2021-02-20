#include <stdio.h>
#include "matrix.h"

void mul_matrix(int n, MATRIX c, MATRIX a, MATRIX b) {
    double *ret, *arg1, *arg2;
    ret = (double *)c;
    arg1 = (double *)a;
    arg2 = (double *)b;

    double sum = 0;

    for (int row = 0; row < n; row++) {
        for (int col = 0; col < n; col++) {
            for (int i = 0; i < n; i++) {
                sum += arg1[i*n+row] * arg2[col*n+i];
            }
            ret[col*n+row] = sum;
            sum = 0;
        }
    }
}
