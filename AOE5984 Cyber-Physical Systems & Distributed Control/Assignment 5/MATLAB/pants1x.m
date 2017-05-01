function [h_dot1x]  = pants1x (t, h1x)

N=100; % number of robots

F_l1x=[ones(N,1)*-.1];

for i=1:N
    h_dot1x(i) = -h1x(i)+F_l1x(i);
end

h_dot1x=h_dot1x'; 
end