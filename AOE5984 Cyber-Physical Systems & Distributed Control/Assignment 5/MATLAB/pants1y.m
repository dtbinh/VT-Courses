function [h_dot1y]  = pants1y (t, h1y)

N=100; % number of robots

F_l1y=[ones(N,1)*.1];

for i=1:N
    h_dot1y(i) = -h1y(i)+F_l1y(i);
end

h_dot1y=h_dot1y'; 
end