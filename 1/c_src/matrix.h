#ifndef __MATRIX_H__
#define __MATRIX_H__

#if defined (__cplusplus)
extern "C" {
#endif

#define MATRIX void*

void mul_matrix(int n, MATRIX c, MATRIX a, MATRIX b);

#if defined (__cplusplus)
}
#endif

#endif
