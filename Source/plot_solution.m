plot_info = load('plot_info.out');
output_arq = load('output_arq.out');

time_steps = plot_info(1,1)
delta_t = plot_info(2,1)
nodes_x = plot_info(3,1)

for i = 1:time_steps
  x = output_arq( ((i-1)*nodes_x + 1):( (i)*nodes_x )  , 1 )
  y = output_arq( ((i-1)*nodes_x + 1):( (i)*nodes_x )  , 2 )
  plot(x,y,"linewidth", 1.5)
  title( strcat("Solution at time :",num2str( i*delta_t )) )
  pause(0.01)
endfor
