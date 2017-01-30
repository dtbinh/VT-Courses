function  [xdot_d6c]  = d6cGraph (t_d6c,x_d6c)

u_d6c(1) = -x_d6c(1)+ x_d6c(6)
xdot_d6c(1)= u_d6c(1)

u_d6c(2) = -x_d6c(2)+ x_d6c(1)
xdot_d6c(2)=u_d6c(2)

u_d6c(3) = -x_d6c(3)+ x_d6c(2)
xdot_d6c(3)=u_d6c(3)

u_d6c(4) = -x_d6c(4)+ x_d6c(3)
xdot_d6c(4)=u_d6c(4)

u_d6c(5) = -x_d6c(5)+ x_d6c(4)
xdot_d6c(5)=u_d6c(5)

u_d6c(6) = -x_d6c(6)+ x_d6c(5)
xdot_d6c(6)=u_d6c(6)

xdot_d6c=xdot_d6c' % xdot transpose