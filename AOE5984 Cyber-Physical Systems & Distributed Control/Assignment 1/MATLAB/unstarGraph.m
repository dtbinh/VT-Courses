function  [xdot_us]  = unstarGraph (t_us,x_us)

u_us(1) = -5*x_us(1) + x_us(2) + x_us(3)  + x_us(4) + x_us(5)  + x_us(6) 
xdot_us(1)= u_us(1)

u_us(2) = -x_us(2) +  x_us(1)
xdot_us(2) = u_us(2)

u_us(3) = -x_us(3) +  x_us(1)
xdot_us(3)=u_us(3)
% 
u_us(4) = -x_us(4) +  x_us(1)
xdot_us(4)=u_us(4)

u_us(5) = -x_us(5) +  x_us(1)
xdot_us(5)=u_us(5)

u_us(6) = -x_us(6) +  x_us(1)
xdot_us(6)=u_us(6)

xdot_us=xdot_us' % xdot transpose