%% #### -------------------------------------------------------------- #### 
%% George Kontoudis, Ph.D. Student, gpkont@vt.edu, www.georgekontoudis.com              
%% Virginia Tech, Department of Mechanical Engineering                         
%% AOE 5984: Cyber-Physical Systems & Distributed Control      
%% Assignment 4, Midterm, Practice examples 
%% CT, DLP, LCP, SDP & W-MSR Solutions
%% #### -------------------------------------------------------------- #### 
clear all;
close all;
clc;
%% Continuous time
% tic; % start time estimation
% 
% x0 = [6 3 2 5 0 -1]'; % initial values
% t_int = [0 10]; % spanning time

% [t,x] = ode23('undirGraph', t_int, x0); % solve odes
% 
% toc; % finish time estimation
% 
% figure (1)
% plot(t,x);
% xlabel('Time [s]');
% ylabel('States');
% legend('x_1', 'x_2', 'x_3', 'x_4', 'x_5', 'x_6');
% title('Undirect graph');

%% Discrete-Time w/ distributed local protocols (DLP) (1-ed_i)x_i+e\sum_j^N(x_j)

% e=.24 % .4 diverges (blow up), why? e should be e<1/d_max=1/4=.25
% x(1)=0
% x1(1)= 6;
% x2(1)= 3;
% x3(1)= 2;
% x4(1)= 5;
% x5(1)= 0;
% x6(1)= -1;
% 
% for t=1:1:20
%     x1(t+1)= (1-e*2)*x1(t)+e*(x2(t)+x3(t));
%     x2(t+1)= (1-e*4)*x2(t)+e*(x1(t)+x3(t)+x4(t)+x6(t));
%     x3(t+1)= (1-e*3)*x3(t)+e*(x1(t)+x2(t)+x6(t));
%     x4(t+1)= (1-e*2)*x4(t)+e*(x2(t)+x6(t));
%     x5(t+1)= (1-e*2)*x5(t)+e*(x3(t)+x6(t));
%     x6(t+1)= (1-e*3)*x3(t)+e*(x2(t)+x4(t)+x5(t));
%     x(t+1) = x(t)+1;
% end
% 
% figure (1)
% plot (x,x1,x,x2,x,x3,x,x4,x,x5,x,x6)
% xlabel('Time [s]');
% ylabel('States');
% legend('x_1', 'x_2', 'x_3', 'x_4', 'x_5', 'x_6');
% title('DLP');

%% Discrete-Time w/ linear consensus algorithm (LCP) w_{ij}x_j

% x(1)= 0;
% x1(1)= 10;
% x2(1)= 9;
% x3(1)= 2;
% x4(1)= 5;
% x5(1)= 0;
% x6(1)= -1;
% 
% for t=1:1:10
%     x1(t+1)= 0.1*x2(t)+0.05*x3(t);
%     x2(t+1)= 0.1*x1(t)+.05*x3(t)+.05*x4(t)+.1*x6(t);
%     x3(t+1)= .05*x1(t)+.05*x2(t)+.05*x6(t);
%     x4(t+1)= .05*x2(t)+.05*x6(t);
%     x5(t+1)= .05*x3(t)+.05*x6(t);
%     x6(t+1)= .1*x2(t)+.05*x4(t)+.05*x5(t);% x6(t)+1;
%     x(t+1) = x(t)+1;
% end
% 
% figure (1)
% plot (x,x1,x,x2,x,x3,x,x4,x,x5,x,x6)
% xlabel('Time [s]');
% ylabel('States');
% legend('x_1', 'x_2', 'x_3', 'x_4', 'x_5', 'x_6');
% title('LCP 1');

% %% Discrete-Time w/ linear consensus algorithm (LCP) w_{ij}(x_j-x_i)
% 
% x(1)= 0;
% x1(1)= 10;
% x2(1)= 9;
% x3(1)= 2;
% x4(1)= 5;
% x5(1)= 0;
% x6(1)= -1;
% 
% for t=1:1:10
%     x1(t+1)= 0.1*(x2(t)-x1(t))+0.05*(x3(t)-x1(t));
%     x2(t+1)= 0.1*(x1(t)-x2(t))+.05*(x3(t)-x2(t))+.05*(x4(t)-x2(t))+.1*(x6(t)-x2(t));
%     x3(t+1)= .05*(x1(t)-x3(t))+.05*(x2(t)-x3(t))+.05*(x6(t)-x3(t));
%     x4(t+1)= .05*(x2(t)-x4(t))+.05*(x6(t)-x4(t));
%     x5(t+1)= .05*(x3(t)-x5(t))+.05*(x6(t)-x5(t));
%     x6(t+1)= .1*(x2(t)-x6(t))+.05*(x4(t)-x6(t))+.05*(x5(t)-x6(t));% x6(t)+1;
%     x(t+1) = x(t)+1;
% end
% 
% figure (1)
% plot (x,x1,x,x2,x,x3,x,x4,x,x5,x,x6)
% xlabel('Time [s]');
% ylabel('States');
% legend('x_1', 'x_2', 'x_3', 'x_4', 'x_5', 'x_6');
% title('LCP 2');

%% Discrete-Time w/ semidefinite program (SDP) w_{ij}x_j=\frac{1}{1+d_i}x_j

% x(1)= 0;
% x1(1)= 10;
% x2(1)= 9;
% x3(1)= 2;
% x4(1)= 5;
% x5(1)= 0;
% x6(1)= -1;
% 
% for t=1:1:30
%     x1(t+1)= (1/3)*x2(t)+(1/3)*x3(t);
%     x2(t+1)= (1/5)*x1(t)+(1/5)*x3(t)+(1/5)*x4(t)+(1/5)*x6(t);
%     x3(t+1)= (1/4)*x1(t)+(1/4)*x2(t)+(1/4)*x6(t);
%     x4(t+1)= (1/3)*x2(t)+(1/3)*x6(t);
%     x5(t+1)= (1/3)*x3(t)+(1/3)*x6(t);
%     x6(t+1)= (1/4)*x2(t)+(1/4)*x4(t)+(1/4)*x5(t);% x6(t)+1;
%     x(t+1) = x(t)+1;
% end
% 
% figure (1)
% plot (x,x1,x,x2,x,x3,x,x4,x,x5,x,x6)
% xlabel('Time [s]');
% ylabel('States');
% legend('x_1', 'x_2', 'x_3', 'x_4', 'x_5', 'x_6');
% title('SDP');

%% Discrete-Time w/ linear consensus alg. for (2,2)-Robust Network Topology
% clear all;
% close all;
% clc;
% 
% % Initial values
% x(1)= 0; x1(1)= 0; x2(1)= 0; x3(1)= 1; x4(1)= 1; x5(1)= 1; x6(1)= 1;
% x7(1)= 1; x8(1)= 1; x9(1)= 1; x10(1)= 1; x11(1)= 0; x12(1)= 0; x13(1)= 1;
% x14(1)= 2;
% 
% x1m(1)= 0; x2m(1)= 0; x3m(1)= 1; x4m(1)= 1; x5m(1)= 1; x6m(1)= 1;
% x7m(1)= 1; x8m(1)= 1; x9m(1)= 1; x10m(1)= 1; x11m(1)= 0; x12m(1)= 0;
% x13m(1)= 1; x14m(1)= 2;
% 
% N=200; % time step
% 
% x_14_step = x14(1)/(N-1); % time step of malicious node
% 
% ed=31; % number of edges
% % m=1 % direct graph multiplicity
% m=2; % undirect graph multiplicity
% tm=(ed*m);% total multiplicity
% tmm=(ed*m)-8 % total multiplicity - malicious node edges
% w=1/tm; % weight for lcp w_{ij}(t)=|J_i(t)|^{-1}
% wm=1/tmm; % weight for w-msr w_{ij}(t)=|J_i(t)\R_i(t)|^{-1}
% w_sum=w*tm % weight for lcp \sum_{j=1}^{N}w_{ij}=1
% wm_sum=wm*tmm % weight for w-msr \sum_{j=1}^{N}w_{ij}=1
% 
% for t=1:1:N
%     x1(t+1)= w*x2(t)+w*x12(t)+w*x11(t)+x14(t);
%     x2(t+1)= w*x1(t)+w*x3(t)+w*x12(t)+x14(t);
%     x3(t+1)= w*x2(t)+w*x4(t)+w*x13(t)+x14(t);
%     x4(t+1)= w*x3(t)+w*x5(t)+w*x13(t)+x14(t);
%     x5(t+1)= w*x6(t)+w*x6(t)+w*x7(t)+w*x8(t)+x14(t);
%     x6(t+1)= w*x5(t)+w*x8(t)+x14(t);
%     x7(t+1)= w*x5(t)+w*x8(t)+w*x9(t)+x14(t);
%     x8(t+1)= w*x5(t)+w*x6(t)+w*x7(t)+w*x9(t)+x14(t);
%     x9(t+1)= w*x7(t)+w*x8(t)+w*x10(t)+w*x13(t)+x14(t);
%     x10(t+1)= w*x9(t)+w*x11(t)+w*x13(t)+x14(t);
%     x11(t+1)= w*x1(t)+w*x10(t)+w*x12(t)+w*x13(t)+x14(t);
%     x12(t+1)= w*x1(t)+w*x2(t)+w*x11(t)+w*x13(t)+x14(t);
%     x13(t+1)= w*x3(t)+w*x4(t)+w*x9(t)+w*x10(t)+w*x11(t)+w*x13(t)+x14(t);
%     for k=2:1:N
%         x14(2)=0;
%         x14(k+1)= x14(k)+x_14_step; % malicious node 
% %         x14(k+1)= w*x3(t)+w*x4(t)+w*x5(t)+w*x7(t)+w*x8(t)+w*x9(t)+w*x10(t)+w*x13(t) % normal node
%     end
%     x(t+1) = x(t)+1;
% end
%  
% for k=1:1:N
%     x1m(k+1)= wm*x2m(k)+wm*x12m(k)+wm*x11m(k);
%     x2m(k+1)= wm*x1m(k)+wm*x3m(k)+wm*x12m(k);
%     x3m(k+1)= wm*x2m(k)+wm*x4m(k)+wm*x13m(k);
%     x4m(k+1)= wm*x3m(k)+wm*x5m(k)+wm*x13m(k);
%     x5m(k+1)= wm*x6m(k)+wm*x6m(k)+wm*x7m(k)+wm*x8m(k);
%     x6m(k+1)= wm*x5m(k)+wm*x8m(k);
%     x7m(k+1)= wm*x5m(k)+wm*x8m(k)+wm*x9m(k);
%     x8m(k+1)= wm*x5m(k)+wm*x6m(k)+wm*x7m(k)+wm*x9m(k);
%     x9m(k+1)= wm*x7m(k)+wm*x8m(k)+wm*x10m(k)+wm*x13m(k);
%     x10m(k+1)= wm*x9m(k)+wm*x11m(k)+wm*x13m(k);
%     x11m(k+1)= wm*x1m(k)+wm*x10m(k)+wm*x12m(k)+wm*x13m(k);
%     x12m(k+1)= wm*x1m(k)+wm*x2m(k)+wm*x11m(k)+wm*x13m(k);
%     x13m(k+1)= wm*x3m(k)+wm*x4m(k)+wm*x9m(k)+wm*x10m(k)+wm*x11m(k)+wm*x13m(k);
%     for l=2:1:N
%         x14m(2)=0;
%         x14m(l+1)= x14m(l)+x_14_step; % malicious node 
%     end
% end
% 
% figure (1)
% p1 = plot(x,x1);
% hold on
% p2 = plot(x,x2,x,x3,x,x4,x,x5,x,x6,x,x7,x,x8,x,x9,x,x10,x,x11,x,x12,x,x13);
% p3 = plot(x,x14,'--');
% hold off
% legend([p1 p3],'Normal nodes','Malicious nodes','Location','northeast')
% xlabel('Time [s]');
% ylabel('States');
% title('LCP');
% 
% figure (2)
% p1 = plot(x,x1m);
% hold on
% p2 = plot(x,x2m,x,x3m,x,x4m,x,x5m,x,x6m,x,x7m,x,x8m,x,x9m,x,x10m,x,x11m,x,x12m,x,x13m);
% p3 = plot(x,x14m,'--');
% hold off
% legend([p1 p3],'Normal nodes','Malicious nodes','Location','northeast')
% xlabel('Time [s]');
% ylabel('States');
% title('LCP');