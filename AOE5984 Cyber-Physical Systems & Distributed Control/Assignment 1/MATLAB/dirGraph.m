function  [xdot]  = dirGraph (t,x)

u(1) = -x(1)+ x(3)
xdot(1)= u(1)

u(2) = -2*x(2) + x(1) +  x(6)
xdot(2)=u(2)

u(3) = -2*x(3) +  x(1) + x(2)
xdot(3)=u(3)

u(4) = -x(4) + x(2)
xdot(4)=u(4)

u(5) = -x(5) + x(3)
xdot(5)=u(5)

u(6) = -2*x(6) + x(4) +x(5)
xdot(6)=u(6)

xdot=xdot' % xdot transpose

    