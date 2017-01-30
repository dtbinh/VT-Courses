function  [xdot_u6c]  = u6cGraph (t_u6c,x_u6c)

u_u6c(1) = -2*x_u6c(1) + x_u6c(6) + x_u6c(2)
xdot_u6c(1)= u_u6c(1)

u_u6c(2) = -2*x_u6c(2) + x_u6c(1) + x_u6c(3) 
xdot_u6c(2)=u_u6c(2)

u_u6c(3) = -2*x_u6c(3) + x_u6c(2) + x_u6c(4)
xdot_u6c(3)=u_u6c(3)

u_u6c(4) = -2*x_u6c(4) + x_u6c(3) + x_u6c(5)
xdot_u6c(4)=u_u6c(4)

u_u6c(5) = -2*x_u6c(5) + x_u6c(4) + x_u6c(6) 
xdot_u6c(5)=u_u6c(5)

u_u6c(6) = -2*x_u6c(6) + x_u6c(5) + x_u6c(1) 
xdot_u6c(6)=u_u6c(6)

xdot_u6c=xdot_u6c' % xdot transpose