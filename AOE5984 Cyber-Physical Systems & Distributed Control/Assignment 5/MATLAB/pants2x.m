function [h_dot2x]  = pants2x (t, h2x)

N=100; % number of robots

F_l2x=[ones(N,1)*.2];

for i=1:N
    h_dot2x(i) = -h2x(i)+F_l2x(i);
end

h_dot2x=h_dot2x';
end