%% #### -------------------------------------------------------------- #### 
%% George Kontoudis, Ph.D. Student, gpkont@vt.edu, www.georgekontoudis.com              
%% Virginia Tech, Department of Mechanical Engineering                         
%% AOE 5984: Cyber-Physical Systems & Distributed Control      
%% Assignment 2, Olfati paper implementation 
%% Graph description and plot
%% #### -------------------------------------------------------------- #### 

clear all;
close all;
clc;

s_co = [1 1  1 1  2 2 2  3 3 4 4 5 5 6 6 7 7 8 8  9  9  10 10 11 11 12 12 13 13 14 14 15 15 16 16 17 17 18 18 19]; % source nodes
t_co = [2 19 3 20 3 4 20 4 5 5 6 6 7 7 8 8 9 9 10 10 11 11 12 12 13 13 14 14 15 15 16 16 17 17 18 18 19 19 20 20]; % target nodes
w_co = [1 1  1 1  1 1 1  1 1 1 1 1 1 1 1 1 1 1 1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1 ]; % weights 
names_co = {'1' '2' '3' '4' '5' '6' '7' '8' '9' '10' '11' '12' '13' '14' '15' '16' '17' '18' '19' '20'}; % node names
ACgraph = graph(s_co,t_co,w_co) % create directed graph
Di_co = degree(ACgraph); % in degrees
D_co = diag(Di_co); % diagonal in-degree matrix
A_co = full(adjacency(ACgraph)); % adjacency matrix
LAC = laplacian(ACgraph); % Laplacian matrix
E=eig(LAC)

figure
plot(ACgraph, 'NodeLabel',{})
set(gca,'xtick',[])
set(gca,'ytick',[])
%title('Regular Network w/ 80 Links');


