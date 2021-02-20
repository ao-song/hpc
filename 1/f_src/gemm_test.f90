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

program gemm_test
    use matrix
    implicit none
    type(matrix_t) :: A, B, C
    integer :: i, j
    call A%init(10,10)
    call B%init(10,10)
    call C%init(10,10)
    ! Fill A, B with data
    do i = 1, 10
        do j = 1, 10
           A%darray(i,j) = i*j
           B%darray(i,j) = 1
        end do
    end do
    C = A * B
    do i = 1, 10
        do j = 1, 10
            print*, "C%darray(",i,",",j,") = ", C%darray(i,j)
        end do
    end do

    deallocate(A%darray)
    deallocate(B%darray)
    deallocate(C%darray)
end program gemm_test
