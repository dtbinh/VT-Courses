%% #### -------------------------------------------------------------- #### 
%% George Kontoudis, Ph.D. Student, gpkont@vt.edu, www.georgekontoudis.com              
%% Virginia Tech, Department of Mechanical Engineering                         
%% AOE 5984: Cyber-Physical Systems & Distributed Control      
%% Semester Project, Cooperative Mobile Manipulation without Communication 
%% Constant Boost Force (CB-ANTS) - Velocity and acceleration of object at CoM
%% #### -------------------------------------------------------------- #### 
clear all;
close all;
clc;
%% #### -------------------------------------------------------------- ####

tic; % start time estimation

M=2; % object mass (kg)
N=20; % number of robots
f_f=0.8; % maximum force of each follower (N)
f_l=0.96; % maximum force of leader (N)
mu_k=.59; % kinetic friction
g=9.81; % acceleration of gravity (m/s^2)
v_t_norm=.3; % maximum velocity value (m/s)

K_p=6; % gain limit to guarantee stability = 10

v_dmax=.3; % maximum desired velocity
v_dx=[-.2*ones(25,1); .2*ones(25,1); .2*ones(25,1); -.2*ones(25,1) ]; % desired velocity x-axis
v_dy=[.2*ones(25,1); .2*ones(25,1); -.2*ones(25,1); -.2*ones(25,1)]; % desired velocity y-axis

v_tx=rand(N)*v_dmax; % random initial values x-axis, max(v_t)=.3
v_ty=rand(N)*v_dmax; % random initial values y-axis, max(v_t)=.3

Dt_max=(N*abs(v_dmax))/(mu_k*g); % Theorem 1 maximum time step
Dt=.3; % value of time step

K=100; % number of time steps
Td=1:100;
td=Dt*Td;
T=1:101;
t=Dt*T;

for i=1:K
    for j=1:N    
    Bx(i,j)=(K_p*(abs(v_dx(i))-abs(v_tx(i,j)))*Dt)/(M*abs(v_dx(i)));
    By(i,j)=(K_p*(abs(v_dy(i))-abs(v_ty(i,j)))*Dt)/(M*abs(v_dy(i)));
    Ax(i,j)=(1-((mu_k*g*Dt)/(N*abs(v_tx(i,j)))));
    Ay(i,j)=(1-((mu_k*g*Dt)/(N*abs(v_ty(i,j)))));
    F_fx(i,j)=(mu_k*M*g*v_tx(i,j))/(N*abs(v_tx(i,j)));
    F_fy(i,j)=(mu_k*M*g*v_ty(i,j))/(N*abs(v_ty(i,j)));
    v_tx(i+1,j)=Ax(i,j)*v_tx(i,j)+Bx(i,j)*v_dx(i);
    v_ty(i+1,j)=Ay(i,j)*v_ty(i,j)+By(i,j)*v_dy(i);
    end
v_tx_mean= mean(v_tx');
v_ty_mean= mean(v_ty');
F_lx(i)=(K_p*(abs(v_dx(i))-abs(v_tx_mean(i)))*v_dx(i))/abs(v_dx(i));
F_ly(i)=(K_p*(abs(v_dy(i))-abs(v_ty_mean(i)))*v_dy(i))/abs(v_dy(i));
end

toc; % end time estimation

%% #### -------------------------------------------------------------- ####
% Plots
figure (1)
for q=1:N
p1=plot(t,v_tx(:,q));
hold on
end
p2=plot(td, v_dx, ':bs');
hold off
grid on
ylabel('V_x [m/s]')
xlabel('t [s]')
legend([p1 p2],'Followers','Leader')

figure (2)
for q=1:N
p3=plot(t,v_ty(:,q));
hold on
end
p4=plot(td, v_dy, ':bs');
hold off
grid on
ylabel('V_y [m/s]')
xlabel('t [s]')
legend([p3 p4],'Followers','Leader')

figure (3)
for q=1:N
p5=plot(td,F_fx(:,q));
hold on
end
p6=plot(td, F_lx, ':bs');
hold off
grid on
ylabel('F_x [N]')
xlabel('t [s]')
legend([p5 p6],'Followers','Leader')

figure (4)
for q=1:N
p7=plot(td,F_fy(:,q));
hold on
end
p8=plot(td, F_ly, ':bs');
hold off
grid on
ylabel('F_y [N]')
xlabel('t [s]')
legend([p7 p8],'Followers','Leader')