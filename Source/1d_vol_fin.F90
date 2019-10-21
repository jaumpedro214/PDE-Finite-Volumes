program finite_volume

	implicit none
	integer i, j , k

	integer output_arq, plot_info

	integer time_steps, nodes_x
	
	real(8) L
	real(8) delta_x, delta_t
	real(8) x_atual
	real(8) cfl

	real(8) FD, FE

	real(8), dimension(:), allocatable :: u_new, u_old

	output_arq = 66
	plot_info = 67
	open(unit = output_arq, file = "output_arq.out")
	open(unit = plot_info, file = "plot_info.out")

	
	L = 1
	nodes_x = 100
	delta_x = L/(nodes_x-1)


	cfl = 0.1
	delta_t = cfl*delta_x
	time_steps = 200


	allocate( u_old(nodes_x) )
	allocate( u_new(nodes_x) )

	write(plot_info, *) time_steps
	write(plot_info, *) delta_t
	write(plot_info, *) nodes_x

	do i = 1, nodes_x
		x_atual = delta_x*(i-1)
		u_old(i) = u0_cond( x_atual )		
		write(output_arq,'(F12.4 F12.4)') x_atual, u_old(i)
	enddo



	do j = 2, time_steps 
		
		u_new(1) = ut_cond( (j-1)*delta_t )

		write(output_arq,'(F12.4 F12.4)') real(0,8), u_new(1) 
		
		do i = 2, nodes_x
			x_atual = delta_x*(i-1)

			FD = FU( u_old(i) , x_atual )
			FE = FU( u_old(i-1), x_atual )

			u_new(i) = u_old(i) - delta_t/( delta_x*phi(x_atual) )*(FD-FE)
			write(output_arq,'(F12.4 F12.4)') x_atual, u_new(i)
		enddo

		u_old = u_new
	
	enddo

	deallocate( u_old )
	deallocate( u_new )
	
	contains

	real(8) function ut_cond(t)
		
		real(8) t
		ut_cond = 1

	end function ut_cond

	real(8) function u0_cond(x)
		real(8) x

		u0_cond = 0
		if( x < 0.5 ) then
			u0_cond = 1
		endif

	end function u0_cond

	real(8) function FU(u, x)
		real(8) u
		real(8) x

		FU = 10*u

	end function FU

	real(8) function phi(x)
		real(8) x
		phi = 1
		if( x > 0.9 ) then
			phi = 10
		endif
	end function phi


end program finite_volume