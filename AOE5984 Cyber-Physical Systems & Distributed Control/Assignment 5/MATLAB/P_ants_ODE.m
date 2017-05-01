%% #### -------------------------------------------------------------- #### 
%% George Kontoudis, Ph.D. Student, gpkont@vt.edu, www.georgekontoudis.com              
%% Virginia Tech, Department of Mechanical Engineering                         
%% AOE 5984: Cyber-Physical Systems & Distributed Control      
%% Semester Project, Cooperative Mobile Manipulation without Communication 
%% Proportional Force (P-ANTS) - Velocity and acceleration of object at CoM
%% #### -------------------------------------------------------------- #### 
clear all;
close all;
clc;
%% #### -------------------------------------------------------------- ####
% Solve ODEs

tic; % start time estimation

N=100;
h_0x=[rand(N/2,1)*.3; rand(N/2,1)*-.3];
h_0y=[rand(N/2,1)*.3; rand(N/2,1)*-.3];
t_init = [0 20]; % spanning time

[t,h1x] = ode23('pants1x', t_init, h_0x); 
[t,h1y] = ode23('pants1y', t_init, h_0y); 

for i=1:N
    h_1x(i,1)=h1x(end,i);
    h_1y(i,1)=h1y(end,i);
end

[t,h2x] = ode23('pants2x', t_init, h_1x); 
[t,h2y] = ode23('pants2y', t_init, h_1y); 

for k=1:N
    h_2x(k,1)=h2x(end,k);
    h_2y(k,1)=h2y(end,k);
end

[t,h3x] = ode23('pants3x', t_init, h_2x); 
[t,h3y] = ode23('pants3y', t_init, h_2y); 

for l=1:N
    h_3x(l,1)=h3x(end,l);
    h_3y(l,1)=h3y(end,l);
end

[t,h4x] = ode23('pants4x', t_init, h_3x); 
[t,h4y] = ode23('pants4y', t_init, h_3y); 

toc;

%% #### -------------------------------------------------------------- ####
% Force Calculations

for i=1:size(h1x,1)
    Fsx_1(i)=(N-1)*mean(h1x(i,:));
end
F_l1x=[ones(size(h1x,1),1)*-.1];
for i=1:size(h2x,1)
    Fsx_2(i)=(N-1)*mean(h2x(i,:));
end
F_l2x=[ones(size(h2x,1),1)*.2];
for i=1:size(h3x,1)
    Fsx_3(i)=(N-1)*mean(h3x(i,:));
end
F_l3x=[ones(size(h3x,1),1)*.25];
for i=1:size(h4x,1)
    Fsx_4(i)=(N-1)*mean(h4x(i,:));
end
F_l4x=[ones(size(h4x,1),1)*0];

for i=1:size(h1y,1)
    Fsy_1(i)=(N-1)*mean(h1y(i,:));
end
F_l1y=[ones(size(h1y,1),1)*.1];
for i=1:size(h2y,1)
    Fsy_2(i)=(N-1)*mean(h2y(i,:));
end
F_l2y=[ones(size(h2y,1),1)*.3];
for i=1:size(h3y,1)
    Fsy_3(i)=(N-1)*mean(h3y(i,:));
end
F_l3y=[ones(size(h3y,1),1)*-.1];
for i=1:size(h4y,1)
    Fsy_4(i)=(N-1)*mean(h4y(i,:));
end
F_l4y=[ones(size(h4y,1),1)*0];

Hx=[h1x; h2x; h3x; h4x];
tx=1:size(Hx,1);
Hy=[h1y; h2y; h3y; h4y];
ty=1:size(Hy,1);
Fx=[Fsx_1'; Fsx_2'; Fsx_3'; Fsx_4'];
Flx=[F_l1x; F_l2x; F_l3x; F_l4x];
tfx=1:size(Fx,1); 
Fy=[Fsy_1'; Fsy_2'; Fsy_3'; Fsy_4'];
Fly=[F_l1y; F_l2y; F_l3y; F_l4y];
tfy=1:size(Fy,1);

%% #### -------------------------------------------------------------- ####
% Plots

figure (1)
for q=1:N
p1=plot(tx,Hx(:,q));
hold on
end
p2=plot(tfx,Flx,':bs');
hold off
grid on
ylabel('F_x [N]')
xlabel('t [s]')
legend([p1, p2], 'Followers','Leader')

figure (2)
for q=1:N
p3=plot(ty,Hy(:,q));
hold on
end
p4=plot(tfy,Fly,':bs'); 
hold off
grid on
ylabel('F_y [N]')
xlabel('t [s]')
legend([p3, p4], 'Followers','Leader')

figure (3)
p5=plot(tfx,Fx);
hold on
p6=plot(tfx,Flx,':bs');
hold off
grid on
ylabel('Sum of F_x [N]')
xlabel('t [s]')
legend([p5, p6], 'Followers','Leader')

figure (4)
p7=plot(tfy,Fy);
hold on
p8=plot(tfy,Fly,':bs'); 
hold off
grid on
ylabel('Sum of F_y [N]')
xlabel('t [s]')
legend([p7, p8], 'Followers','Leader')