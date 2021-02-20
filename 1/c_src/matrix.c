#include <stdio.h>
#include "matrix.h"

void mul_matrix(int n, double c[n][n], double a[n][n], double b[n][n]) {

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
