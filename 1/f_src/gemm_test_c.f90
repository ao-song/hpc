module c_matrix
    interface
        subroutine c_mul_matrix(n, r, a, b) bind(c, name='mul_matrix')
            use, intrinsic :: iso_c_binding
            implicit none
            integer(kind=c_int), value :: n
            real(kind=c_double) :: r(n, n), a(n, n), b(n, n)
        end subroutine
    end interface
end module

program gemm_test
    use, intrinsic :: iso_c_binding
    use c_matrix
    use iso_fortran_env, only : real64
    implicit none
    integer :: n
    real(kind=real64), dimension(10, 10) :: a
    real(kind=real64), dimension(10, 10) :: b
    real(kind=real64), dimension(10, 10) :: c
    integer :: i, j

    n = 10
    ! Fill A, B with data
    do i = 1, 10
        do j = 1, 10
           a(i,j) = i*j
           b(i,j) = 1
        end do
    end do

    call c_mul_matrix(n, c, a, b)

    do i = 1, 10
        do j = 1, 10
            print*, "result(",i,",",j,") = ", c(i,j)
        end do
    end do
end program gemm_test
