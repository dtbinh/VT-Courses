function  [xdot_un]  = undirGraph (t_un,x_un)

u_un(1) = -2*x_un(1)+ x_un(2) + x_un(3)
xdot_un(1)= u_un(1)

u_un(2) = -4*x_un(2)+ x_un(1) + x_un(3) + x_un(4) + x_un(6)
xdot_un(2)=u_un(2)

u_un(3) = -3*x_un(3)+ x_un(1) + x_un(2) + x_un(5)
xdot_un(3)=u_un(3)

u_un(4) = -2*x_un(4)+ x_un(2) + x_un(6)
xdot_un(4)=u_un(4)

u_un(5) = -2*x_un(5)+ x_un(6) + x_un(3)
xdot_un(5)=u_un(5)

u_un(6) = -3*x_un(6)+ x_un(2) + x_un(4) + x_un(5)
xdot_un(6)=u_un(6)

xdot_un=xdot_un' % xdot transpose