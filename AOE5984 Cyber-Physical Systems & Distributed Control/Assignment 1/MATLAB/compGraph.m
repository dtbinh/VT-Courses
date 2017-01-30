function  [xdot_comp]  = compGraph (t_co,x_co)

u_co(1) = -5*x_co(1) + x_co(2) + x_co(3) + x_co(4) + x_co(5) + x_co(6) 
xdot_comp(1)= u_co(1)

u_co(2) = -5*x_co(2) + x_co(1) + x_co(3) + x_co(4) + x_co(5) + x_co(6) 
xdot_comp(2)=u_co(2)

u_co(3) = -5*x_co(3) + x_co(2) + x_co(1) + x_co(4) + x_co(5) + x_co(6) 
xdot_comp(3)=u_co(3)

u_co(4) = -5*x_co(4) + x_co(2) + x_co(3) + x_co(1) + x_co(5) + x_co(6) 
xdot_comp(4)=u_co(4)

u_co(5) = -5*x_co(5) + x_co(2) + x_co(3) + x_co(4) + x_co(1) + x_co(6) 
xdot_comp(5)=u_co(5)

u_co(6) = -5*x_co(6) + x_co(2) + x_co(3) + x_co(4) + x_co(5) + x_co(1) 
xdot_comp(6)=u_co(6)

xdot_comp=xdot_comp' % xdot transpose