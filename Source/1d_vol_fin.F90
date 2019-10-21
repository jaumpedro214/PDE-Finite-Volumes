program finite_volume

	implicit none
	integer i, j , k

	integer output_arq, plot_info

	integer time_steps, nodes_x
	
	real(8) L
	real(8) delta_x, delta_t
	real(8) x_atual
	real(8) cfl

	real(8), dimension(:), allocatable :: u_new, u_old

	output_arq = 66
	plot_info = 67
	open(unit = output_arq, file = "output_arq.out")
	open(unit = plot_info, file = "plot_info.out")

	L = 3.1415
	nodes_x = 100
	delta_x = L/(nodes_x-1)

	cfl = 0.5
	delta_t = cfl*delta_x

	allocate( u_old(nodes_x) )
	allocate( u_new(nodes_x) )

	do i = 1, nodes_x
		x_atual = delta_x*(i-1)
		u_old(i) = u0_cond( x_atual )

	enddo



	deallocate( u_old )
	deallocate( u_new )
	
	contains

	real(8) function u0_cond(x)
		real(8) x
		u0_cond = sin(x)

	end function u0_cond

	real(8) function phi(x)
		real(8) x
		phi = 1
	end function phi

end program finite_volume