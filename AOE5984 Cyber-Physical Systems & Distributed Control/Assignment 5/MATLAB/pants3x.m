function [h_dot3x]  = pants3x (t, h3x)

N=100; % number of robots

F_l3x=[ones(N,1)*.25];

for i=1:N
    h_dot3x(i) = -h3x(i)+F_l3x(i);
end

h_dot3x=h_dot3x'; 
end