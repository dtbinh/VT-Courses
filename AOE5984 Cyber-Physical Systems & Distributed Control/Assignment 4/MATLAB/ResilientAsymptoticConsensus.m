%% #### -------------------------------------------------------------- #### 
%% George Kontoudis, Ph.D. Student, gpkont@vt.edu, www.georgekontoudis.com              
%% Virginia Tech, Department of Mechanical Engineering                         
%% AOE 5984: Cyber-Physical Systems & Distributed Control      
%% Assignment 4, Midterm, Resilient Aysmptotic Consensus in Robust Networks 
%% LCP & W-MSR Solutions
%% #### -------------------------------------------------------------- #### 
clear all;
close all;
clc;
%% Discrete-Time w/ linear consensus alg. for (2,2)-Robust Network Topology

% Initial values LCP
x(1)= 0; x1(1)= 0; x2(1)= 0; x3(1)= 1; x4(1)= 1; x5(1)= 1; x6(1)= 1;
x7(1)= 1; x8(1)= 1; x9(1)= 1; x10(1)= 1; x11(1)= 0; x12(1)= 0; x13(1)= 1;
x14(1)= 2;

% Initial values W-MSR
x1m(1)= 0; x2m(1)= 0; x3m(1)= 1; x4m(1)= 1; x5m(1)= 1; x6m(1)= 1;
x7m(1)= 1; x8m(1)= 1; x9m(1)= 1; x10m(1)= 1; x11m(1)= 0; x12m(1)= 0;
x13m(1)= 1; x14m(1)= 2;

N=200; % time step

x_14_step = x14(1)/(N-1); % time step of malicious node

w1=1/4;w2=1/4;w3=1/5;w4=1/5;w5=1/6;w6=1/3;w7=1/5;w8=1/6;w9=1/6;
w10=1/5;w11=1/5;w12=1/5;w13=1/8; % weight LCP \sum_{j=1}^{N}w_{ij}=1

% Linear Consensus Protocol (LCP) 
for t=1:1:N
    x1(t+1)= w1*x1(t)+w1*x2(t)+w1*x12(t)+w1*x11(t);
    x2(t+1)= w2*x2(t)+w2*x1(t)+w2*x3(t)+w2*x12(t);
    x3(t+1)= w3*x3(t)+w3*x2(t)+w3*x4(t)+w3*x13(t)+w3*x14(t);
    x4(t+1)= w4*x4(t)+w4*x3(t)+w4*x5(t)+w4*x13(t)+w4*x14(t);
    x5(t+1)= w5*x5(t)+w5*x6(t)+w5*x4(t)+w5*x7(t)+w5*x8(t)+w5*x14(t);
    x6(t+1)= w6*x6(t)+w6*x5(t)+w6*x8(t);
    x7(t+1)= w7*x7(t)+w7*x5(t)+w7*x8(t)+w7*x9(t)+w7*x14(t);
    x8(t+1)= w8*x8(t)+w8*x5(t)+w8*x6(t)+w8*x7(t)+w8*x9(t)+w8*x14(t);
    x9(t+1)= w9*x9(t)+w9*x7(t)+w9*x8(t)+w9*x10(t)+w9*x13(t)+w9*x14(t);
    x10(t+1)= w10*x10(t)+w10*x9(t)+w10*x11(t)+w10*x13(t)+w10*x14(t);
    x11(t+1)= w11*x11(t)+w11*x1(t)+w11*x10(t)+w11*x12(t)+w11*x13(t);
    x12(t+1)= w12*x12(t)+w12*x1(t)+w12*x2(t)+w12*x11(t)+w12*x13(t);
    x13(t+1)= w13*x13(t)+w13*x3(t)+w13*x4(t)+w13*x9(t)+w13*x10(t)+w13*x11(t)+w13*x12(t)+w13*x14(t);
    for m=2:1:N
        x14(2)=0;
        x14(m+1)= x14(m)+x_14_step; % malicious node 
    end
    x(t+1) = x(t)+1;
end


wm1=1/4;wm2=1/4;wm3=1/4;wm4=1/4;wm5=1/5;wm6=1/3;wm7=1/4;wm8=1/5;wm9=1/5;
wm10=1/4;wm11=1/5;wm12=1/5;wm13=1/7; % weight W_MSR \sum_{j=1}^{N}w_{ij}=1

% Weigthed-Mean Subsequence Reduced (W-MSR)
for k=1:1:N
    x1m(k+1)= wm1*x1m(k)+wm1*x2m(k)+wm1*x12m(k)+wm1*x11m(k);
    x2m(k+1)= wm2*x2m(k)+wm2*x1m(k)+wm2*x12m(k)+wm2*x3m(k);
    x3m(k+1)= wm3*x3m(k)+wm3*x4m(k)+wm3*x13m(k)+wm3*x2m(k);
    x4m(k+1)= wm4*x4m(k)+wm4*x3m(k)+wm4*x5m(k)+wm4*x13m(k);
    x5m(k+1)= wm5*x5m(k)+wm5*x4m(k)+wm5*x6m(k)+wm5*x7m(k)+wm5*x8m(k);
    x6m(k+1)= wm6*x6m(k)+wm6*x5m(k)+wm6*x8m(k);
    x7m(k+1)= wm7*x7m(k)+wm7*x5m(k)+wm7*x8m(k)+wm7*x9m(k);
    x8m(k+1)= wm8*x8m(k)+wm8*x5m(k)+wm8*x6m(k)+wm8*x7m(k)+wm8*x9m(k);
    x9m(k+1)= wm9*x9m(k)+wm9*x7m(k)+wm9*x8m(k)+wm9*x10m(k)+wm9*x13m(k);
    x10m(k+1)= wm10*x10m(k)+wm10*x9m(k)+wm10*x13m(k)+wm10*x11m(k);
    x11m(k+1)= wm11*x11m(k)+wm11*x1m(k)+wm11*x12m(k)+wm11*x10m(k)+wm11*x13m(k);
    x12m(k+1)= wm12*x12m(k)+wm12*x1m(k)+wm12*x2m(k)+wm12*x11m(k)+wm12*x13m(k);
    x13m(k+1)= wm13*x13m(k)+wm13*x3m(k)+wm13*x4m(k)+wm13*x9m(k)+wm13*x10m(k)+wm13*x11m(k)+wm13*x12m(k);
    for l=2:1:N
        x14m(2)=0;
        x14m(l+1)= x14m(l)+x_14_step; % malicious node 
    end
end

%% Figures
figure (1)
p1 = plot(x,x1);
hold on
p2 = plot(x,x2,x,x3,x,x4,x,x5,x,x6,x,x7,x,x8,x,x9,x,x10,x,x11,x,x12,x,x13);
p3 = plot(x,x14,'--');
axis([0 inf -.1 inf]);
hold off
legend([p1 p3],'Normal nodes','Malicious node','Location','northwest')
xlabel('Time [s]');
ylabel('States');
title('LCP');


figure (2)
p1 = plot(x,x1m);
hold on
p2 = plot(x,x2m,x,x3m,x,x4m,x,x5m,x,x6m,x,x7m,x,x8m,x,x9m,x,x10m,x,x11m,x,x12m,x,x13m);
p3 = plot(x,x14m,'--');
axis([0 inf -.1 inf]);
hold off
legend([p1 p3],'Normal nodes','Malicious node','Location','northwest')
xlabel('Time [s]');
ylabel('States');
title('W-MSR');