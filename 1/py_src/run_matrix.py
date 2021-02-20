#!/usr/bin/env python3

import mul_matrix
import numpy as np

def run():
    a = np.random.random([10, 10])
    b = np.random.random([10, 10])
    c = np.zeros((10, 10))

    mul_matrix.mul_matrix(c, a, b)

    print('The array after call mul_matrix is:')
    print(c)

    d = np.zeros((10, 10))
    np.matmul(a, b, out=d)

    print('The array after call np * is:')
    print(d)

if __name__ == '__main__':
    run()
