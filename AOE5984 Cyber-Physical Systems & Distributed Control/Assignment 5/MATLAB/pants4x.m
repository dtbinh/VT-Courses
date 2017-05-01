function [h_dot4x]  = pants4x (t, h4x)

N=100; % number of robots

F_l4x=[ones(N,1)*0];

for i=1:N
    h_dot4x(i) = -h4x(i)+F_l4x(i);
end

h_dot4x=h_dot4x'; 
end