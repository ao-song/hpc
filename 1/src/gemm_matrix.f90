module matrix
    use, intrinsic :: iso_c_binding
    implicit none

    type matrix_t
        integer :: row, col
        real(c_double), pointer :: data(:,:)
    contains
        procedure, pass(this) :: init => init_matrix
        procedure, pass(this) :: free => free_matrix
        procedure :: mul_mx => mul_matrix
        generic :: operator(*) => mul_mx
    end type matrix_t

    interface
        subroutine c_mul_matrix(n, r, a, b) bind(c, name='mul_matrix')
            use, intrinsic :: iso_c_binding
            implicit none
            integer(kind=c_int), value :: n
            type(c_ptr), value :: r, a, b
        end subroutine
    end interface

contains
    subroutine init_matrix(this, r, c)
        class(matrix_t), intent(inout) :: this
        integer :: c, r
        allocate(this%data(r, c))
        this%col = c
        this%row = r
    end subroutine

    subroutine free_matrix(this)
        class(matrix_t), intent(inout) :: this
        deallocate(this%data)
    end subroutine

    function mul_matrix(a, b) result(c)
        class(matrix_t), intent(in) :: a, b
        type(matrix_t) :: c
        call c%init(b%col, a%row)
        a%data = transpose(a%data)
        b%data = transpose(b%data)
        call c_mul_matrix(a%row, c_loc(c%data), c_loc(a%data), c_loc(b%data))
        a%data = transpose(a%data)
        b%data = transpose(b%data)
        c%data = transpose(c%data)
        ! real, dimension(:,:), allocatable :: x
        ! real :: sum
        ! integer :: i, j, k

        ! allocate(x(a%row, b%col))
        ! sum = 0.0
        ! do i = 1, a%row
        !     do j = 1, b%col
        !         do k = 1, b%row
        !             sum = sum + a%data(i, k) * b%data(k, j)
        !         end do
        !         x(i, j) = sum
        !         sum = 0
        !     end do
        ! end do

        ! c%data = x
    end function
end module matrix
