function [h_dot4y]  = pants4y (t, h4y)

N=100; % number of robots

F_l4y=[ones(N,1)*0];

for i=1:N
    h_dot4y(i) = -h4y(i)+F_l4y(i);
end

h_dot4y=h_dot4y'; 
end