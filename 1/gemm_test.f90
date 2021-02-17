program gemm_test
    use matrix
    implicit none
    type(matrix_t) :: A, B, C
    call A%init(10,10)
    call B%init(10,10)
    call C%init(10,10)
    ! Fill A, B with data
    C = A * B
end program gemm_test