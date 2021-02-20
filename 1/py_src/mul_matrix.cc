#include "pybind11/pybind11.h"
#include "pybind11/numpy.h"     // Include the Pybind11 header

#include <assert.h>

namespace py = pybind11;

#define MATRIX py::array_t<double>&

void mul_matrix(MATRIX c, MATRIX a, MATRIX b) {
    py::buffer_info c_info = c.request();
    py::buffer_info a_info = a.request();
    py::buffer_info b_info = b.request();

    int a_row = a_info.shape[0];
    int a_col = a_info.shape[1];
    int b_row = b_info.shape[0];
    int b_col = b_info.shape[1];
    int c_row = c_info.shape[0];
    int c_col = c_info.shape[1];

    // sanity checks
    assert(a_info.ndim == 2 && b_info.ndim == 2 && c_info.ndim==2); // 2D arrays
    assert(a_col == b_row); // a, b could multiply
    assert(c_row == a_row && c_col == b_col); // c in good shape

    double *a_ptr = (double *)a_info.ptr;
    double *b_ptr = (double *)b_info.ptr;
    double *c_ptr = (double *)c_info.ptr;

    double sum = 0;
    for (int i = 0; i < a_row; i++) {
        for (int j = 0; j < b_col; j++) {
            for (int k = 0; k < a_col; k++) {
                sum += a_ptr[i*a_col+k] * b_ptr[k*b_col+j];
            }
            c_ptr[i*c_col+j] = sum;
            sum = 0;
        }
    }
}

/* name of module-   ---a variable with type py::module_ to create the binding */
/*               |   |                                                                                                */
/*               v   v                                                                                               */
PYBIND11_MODULE(mul_matrix, m) {                            // Create a module using the PYBIND11_MODULE macro
    m.doc() = "pybind11 mul_matrix module";
    m.def("mul_matrix", &mul_matrix, "Multiply two matrice"); // calls module::def() to create generate binding code that exposes mul_matrix()
}
