function [h_dot2y]  = pants2y (t, h2y)

N=100; % number of robots

F_l2y=[ones(N,1)*.3];

for i=1:N
    h_dot2y(i) = -h2y(i)+F_l2y(i);
end

h_dot2y=h_dot2y'; 
end