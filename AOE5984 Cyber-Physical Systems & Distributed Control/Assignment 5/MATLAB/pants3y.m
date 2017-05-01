function [h_dot3y]  = pants3y (t, h3y)

N=100; % number of robots

F_l3y=[ones(N,1)*-.1];

for i=1:N
    h_dot3y(i) = -h3y(i)+F_l3y(i);
end

h_dot3y=h_dot3y'; 
end