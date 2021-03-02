module matrix
    implicit none

    type matrix_t
        integer :: row, col
        real, dimension (:,:), allocatable :: darray
    contains
        procedure, pass(this) :: init => init_matrix
        procedure :: mul_mx => mul_matrix
        generic :: operator(*) => mul_mx
    end type matrix_t

contains
    subroutine init_matrix(this, r, c)
        class(matrix_t), intent(inout) :: this
        integer :: c, r
        allocate(this%darray(r, c))
        this%col = c
        this%row = r
    end subroutine

    function mul_matrix(a, b) result(c)
        class(matrix_t), intent(in) :: a, b
        type(matrix_t) :: c
        real, dimension(:,:), allocatable :: x
        real :: sum
        integer :: i, j, k

        allocate(x(a%row, b%col))
        sum = 0.0
        do i = 1, a%row
            do j = 1, b%col
                do k = 1, b%row
                    sum = sum + a%darray(i, k) * b%darray(k, j)
                end do
                x(i, j) = sum
                sum = 0
            end do
        end do

        c%darray = x
    end function
end module matrix

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

    a = transpose(a)
    b = transpose(b)

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

    a = transpose(a)
    b = transpose(b)
    c = transpose(c)

    do i = 1, 10
        do j = 1, 10
            print*, "result(",i,",",j,") = ", c(i,j)
        end do
    end do

    deallocate(c)
    deallocate(a)
    deallocate(b)
end program gemm_test
