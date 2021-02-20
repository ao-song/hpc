module c_matrix
    interface
        subroutine c_mul_matrix(n, r, a, b) bind(c, name='mul_matrix')
            use, intrinsic :: iso_c_binding
            implicit none
            integer(kind=c_int), value :: n
            type(c_ptr), value :: r, a, b
        end subroutine
    end interface
end module

program gemm_test
    use, intrinsic :: iso_c_binding
    use c_matrix
    use iso_fortran_env, only : real64
    implicit none
    real(kind=real64), dimension(:,:), allocatable, target :: a
    real(kind=real64), dimension(:,:), allocatable, target :: b
    real(kind=real64), dimension(:,:), allocatable, target :: c
    integer :: n
    integer :: i, j
    type(c_ptr) :: aptr
    type(c_ptr) :: bptr
    type(c_ptr) :: cptr

    n = 10
    allocate(a(10, 10))
    allocate(b(10, 10))
    allocate(c(10, 10))

    aptr = c_loc(a(1, 1))
    bptr = c_loc(b(1, 1))
    cptr = c_loc(c(1, 1))

    ! Fill A, B with data
    do i = 1, 10
        do j = 1, 10
           a(i,j) = i*j
           b(i,j) = 1
        end do
    end do

    call c_mul_matrix(n, cptr, aptr, bptr)

    do i = 1, 10
        do j = 1, 10
            print*, "result(",i,",",j,") = ", c(i,j)
        end do
    end do

    deallocate(c)
    deallocate(a)
    deallocate(b)
end program gemm_test
