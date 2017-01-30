function  [xdot_dt]  = ditrGraph (t_dt,x_dt)

u_dt(1) = 0
xdot_dt(1)= u_dt(1)

u_dt(2) = -x_dt(2) +  x_dt(1)
xdot_dt(2) = u_dt(2)

u_dt(3) = -x_dt(3) +  x_dt(1)
xdot_dt(3)=u_dt(3)
% 
u_dt(4) = -x_dt(4) +  x_dt(2)
xdot_dt(4)=u_dt(4)

u_dt(5) = -x_dt(5) +  x_dt(3)
xdot_dt(5)=u_dt(5)

u_dt(6) = -x_dt(6) +  x_dt(3)
xdot_dt(6)=u_dt(6)

xdot_dt=xdot_dt' % xdot transpose