function  [xdot_ds]  = distarGraph (t_ds,x_ds)

u_ds(1) = 0
xdot_ds(1)= u_ds(1)

u_ds(2) = -x_ds(2) + x_ds(1) 
xdot_ds(2)=u_ds(2)  

u_ds(3) = -x_ds(3) + x_ds(1) 
xdot_ds(3)=u_ds(3)

u_ds(4) = -x_ds(4) + x_ds(1) 
xdot_ds(4)=u_ds(4)

u_ds(5) = -x_ds(5) + x_ds(1) 
xdot_ds(5)=u_ds(5)

u_ds(6) = -x_ds(6) + x_ds(1) 
xdot_ds(6)=u_ds(6)

xdot_ds=xdot_ds' % xdot transpose