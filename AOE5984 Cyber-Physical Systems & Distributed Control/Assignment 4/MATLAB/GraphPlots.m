%% #### -------------------------------------------------------------- #### 
%% George Kontoudis, Ph.D. Student, gpkont@vt.edu, www.georgekontoudis.com              
%% Virginia Tech, Department of Mechanical Engineering                         
%% AOE 5984: Cyber-Physical Systems & Distributed Control      
%% Assignment 4, Midterm, Resilient Aysmptotic Consensus in Robust Networks 
%% (2,2)-Robust Network Topology
%% #### -------------------------------------------------------------- #### 
clear all;
close all;
clc;
%%

s_un = [1 1  1  2 2  3 3  3  4  4  4 5  5 5 5 6 8 8  7 7 7  9  9  9  10 10 10 11 11 12 13]; % source nodes
t_un = [2 11 12 3 12 4 13 14 13 14 5 14 7 6 8 8 9 14 8 9 14 14 13 10 14 13 11 12 13 13 14]; % target nodes
w_un = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ]; % weights 
names_un = {'1' '2' '3' '4' '5' '6' '7' '8' '9' '10' '11' '12' '13' '14'}; % node names
ABgraph = graph(s_un,t_un,w_un,names_un); % create directed graph
% Di_un = degree(ABgraph); % in degrees
% D_un = diag(Di_un); % diagonal in-degree matrix
% A_un = full(adjacency(ABgraph)) % adjacency matrix
% LAB = laplacian(ABgraph); % Laplacian matrix

figure
plot(ABgraph)
set(gca,'xtick',[])
set(gca,'ytick',[])
title('(2,2)-Robust network Topology');


ed=31; % number of edges
% m=1 % direct graph multiplicity
m=2; % undirect graph multiplicity
tm=(ed*m)%-8; % total multiplicity - malicious node
w=1/tm; % weight for lcp \sum_{j=1}^{N}w_{ij}=1
w1=1/3;w2=w1;w3=1/4;w4=w3;w5=1/5;w6=1/2;w7=w3;w8=w6;w9=w6;w10=w3;w11=w3;
w12=w3;w13=1/7;w14=1/8;

N=5; % time step
x_14_step = x14(1)/198; % time step of malicious node

for t=1:1:N
    x1(t+1)= w1*x2(t)+w1*x12(t)+w1*x11(t);
    x2(t+1)= w2*x1(t)+w2*x3(t)+w2*x12(t);
    x3(t+1)= w3*x2(t)+w3*x4(t)+w3*x13(t)+w3*x14(t);
    x4(t+1)= w4*x3(t)+w4*x5(t)+w4*x13(t)+w4*x14(t);
    x5(t+1)= w5*x6(t)+w5*x6(t)+w5*x7(t)+w5*x8(t)+w5*x14(t);
    x6(t+1)= w6*x5(t)+w6*x8(t);
    x7(t+1)= w7*x5(t)+w7*x8(t)+w7*x9(t)+w7*x14(t);
    x8(t+1)= w8*x5(t)+w8*x6(t)+w8*x7(t)+w8*x9(t)+w8*x14(t);
    x9(t+1)= w9*x7(t)+w9*x8(t)+w9*x10(t)+w9*x13(t)+w9*x14(t);
    x10(t+1)= w10*x9(t)+w10*x11(t)+w10*x13(t)+w10*x14(t);
    x11(t+1)= w11*x1(t)+w11*x10(t)+w11*x12(t)+w11*x13(t);
    x12(t+1)= w12*x1(t)+w12*x2(t)+w12*x11(t)+w12*x13(t);
    x13(t+1)= w13*x3(t)+w13*x4(t)+w13*x9(t)+w13*x10(t)+w13*x11(t)+w13*x13(t)+w13*x14(t);
    for k=1:1:N
        x14(k+1)= w14*x3(t)+w14*x4(t)+w14*x5(t)+w14*x7(t)+w14*x8(t)+w14*x9(t)+w14*x10(t)+w14*x13(t)% x14(k)+x_14_step; % malicious node w*x3(t)+w*x4(t)+w*x5(t)+w*x7(t)+w*x8(t)+w*x9(t)+w*x10(t)+w*x13(t)
    end
    x(t+1) = x(t)+1;
end