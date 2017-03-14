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
A_un = full(adjacency(ABgraph)) % adjacency matrix
% LAB = laplacian(ABgraph); % Laplacian matrix

figure (1)
plot(ABgraph,'LineWidth',2.5, 'Marker','o','NodeColor', 'r')
set(gca,'xtick',[])
set(gca,'ytick',[])