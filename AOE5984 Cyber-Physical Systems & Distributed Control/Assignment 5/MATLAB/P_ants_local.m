%% #### -------------------------------------------------------------- #### 
%% George Kontoudis, Ph.D. Student, gpkont@vt.edu, www.georgekontoudis.com              
%% Virginia Tech, Department of Mechanical Engineering                         
%% AOE 5984: Cyber-Physical Systems & Distributed Control      
%% Semester Project, Cooperative Mobile Manipulation without Communication 
%% P-ANTS local measurements
%% #### -------------------------------------------------------------- #### 
clear all;
close all;
clc;
%% Solve ODEs

tic; % start time estimation

N=350;

f0=[.4; .6; rand(N-1,1)*.3; -rand(N-1,1)*.3]';
t_int = [0 20]; % spanning time

options = odeset('OutputFcn',@odeplot,'RelTol',1e-4,'MaxStep',.05); %low reltol VERY IMPORTANT

[t,f] = ode45('floc', t_int, f0, options); % ode silution 

toc;

%% Plots

tx=1:size(f,1);

figure (1)
for q=3:2:N
p1=plot(tx,f(:,q));
hold on
end
p2=plot(tx,f(:,1),':bs');
hold off
grid on
ylabel('F_x [N]')
xlabel('t')
legend([p1, p2], 'Followers','Leader')
set(gca,'fontsize',21)

figure (2)
for q=4:2:N
p3=plot(tx,f(:,q));
hold on
end
p4=plot(tx,f(:,2),':bs'); 
hold off
grid on
ylabel('F_y [N]')
xlabel('t')
legend([p3, p4], 'Followers','Leader')
set(gca,'fontsize',21)