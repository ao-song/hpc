subroutine matrix (a)
    implicit none

       integer, dimension (5), intent (out) :: a

       ! local variables
       integer :: i
       do i = 1, 5
          a(i) = i
       end do

end subroutine matrix
