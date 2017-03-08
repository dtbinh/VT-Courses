function  [xdot]  = undirGraph (t,x)

u(1) = -2*x(1)+ x(2) + x(3);
xdot(1)= u(1);

u(2) = -4*x(2)+ x(1) + x(3) + x(4) + x(6);
xdot(2)=u(2);

u(3) = -3*x(3)+ x(1) + x(2) + x(5);
xdot(3)=u(3);

u(4) = -2*x(4)+ x(2) + x(6);
xdot(4)=u(4);

u(5) = -2*x(5)+ x(6) + x(3);
xdot(5)=u(5);

u(6) = -3*x(6)+ x(2) + x(4) + x(5);
xdot(6)=u(6);

xdot=xdot'; % xdot transpose