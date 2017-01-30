function  [xdot_u5]  = u5Graph (t_u5,x_u5)

u_u5(1) = -x_u5(1) + x_u5(2)
xdot_u5(1)= u_u5(1)

u_u5(2) = -2*x_u5(2) + x_u5(1) + x_u5(3) 
xdot_u5(2)=u_u5(2)

u_u5(3) = -2*x_u5(3) + x_u5(2) + x_u5(4)
xdot_u5(3)=u_u5(3)

u_u5(4) = -2*x_u5(4) + x_u5(3) + x_u5(5)
xdot_u5(4)=u_u5(4)

u_u5(5) = -2*x_u5(5) + x_u5(4) + x_u5(6) 
xdot_u5(5)=u_u5(5)

u_u5(6) = -x_u5(6) + x_u5(5)  
xdot_u5(6)=u_u5(6)

xdot_u5=xdot_u5' % xdot transpose