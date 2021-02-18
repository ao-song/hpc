#include <stdio.h>
#include "matrix.h"

int is_square(int n, double **m) {
    return sizeof(m)/sizeof(double*) == n && sizeof(*m)/sizeof(double) == n;
}

void matrix(int n, double **c, double **a, double **b) {
    if (!is_square(n, a) || !is_square(n, b) || !is_square(n, c)) {
        perror("The input matrix is not n squared!\n");
        return;
    }

    double sum = 0;

    for (int row = 0; row < n; row++) {
        for (int col = 0; col < n; col++) {
            for (int i = 0; i < n; i++) {
                sum += a[row][i] * b[i][col];
            }
            c[row][col] = sum;
            sum = 0;
        }
    }
}
