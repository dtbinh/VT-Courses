%% #### -------------------------------------------------------------- #### 
%% George Kontoudis, Ph.D. Student, gpkont@vt.edu, www.georgekontoudis.com              
%% Virginia Tech, Department of Mechanical Engineering                         
%% AOE 5984: Cyber-Physical Systems & Distributed Control      
%% Assignment 3, Double-Integrator Formation 
%% ODE sln's
%% #### -------------------------------------------------------------- #### 
clear all;
close all;
clc;
%% #### -------------------------------------------------------------- ####
% Solve ODEs
tic; % start time estimation
x0 = [0 0 1 1 
    50 180 0 0 
    0 50 0 0 
    120 0 0 0 
    180 80 0 0 
    200 180 0 0]'; % initial states

t_int = [0 200]; % spanning time

[t,x] = ode45('ditrGraph_ddot', t_int, x0); % solve odes

toc; % finish time estimation

%% #### -------------------------------------------------------------- ####
% Plots
figure (1)
plot(x(:,1),x(:,2),x(:,5),x(:,6),x(:,9),x(:,10),x(:,13),x(:,14),x(:,17),x(:,18),x(:,21),x(:,22));
xlabel('x');
ylabel('y');
grid on
    
figure (2)
plot(x(:,3),x(:,4),x(:,7),x(:,8),x(:,11),x(:,12),x(:,15),x(:,16),x(:,19),x(:,20),x(:,23),x(:,24));
xlabel('v_x');
ylabel('v_y');
grid on

figure (3)
scatter3(x(:,3),x(:,4),t, 'o')
hold on
scatter3(x(:,7),x(:,8),t, '+')
hold on
scatter3(x(:,11),x(:,12),t, '*')
hold on
scatter3(x(:,15),x(:,16),t, '.')
hold on
scatter3(x(:,19),x(:,20),t, 'x')
hold on
scatter3(x(:,23),x(:,24),t, 's')
hold off
xlabel('v_x')
ylabel('v_y')
zlabel('t')

