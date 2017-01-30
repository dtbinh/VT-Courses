%% #### -------------------------------------------------------------- #### 
%% George Kontoudis, Ph.D. Student, gpkont@vt.edu, www.georgekontoudis.com              
%% Virginia Tech, Department of Mechanical Engineering                         
%% AOE 5984: Cyber-Physical Systems & Distributed Control      
%% Assignment 1, Single-Integrator Consensus for Different Graph Topologies 
%% Graph description and plots
%% #### -------------------------------------------------------------- #### 

clear all;
close all;
clc;

s = [1 1 3 2 2 6 3 4 5]; % source nodes
r = [2 3 1 3 4 2 5 6 6]; % target nodes
w = [1 1 1 1 1 1 1 1 1]; % weights 
AAgraph = digraph(s,r,w); % create directed graph
Di = indegree(AAgraph); % in degrees
D = diag(Di); % diagonal in-degree matrix
A = full(adjacency(AAgraph)); % adjacency matrix
L=D-A; % Laplacian matrix


s_un = [1 1 2 2 2 3 4 5]; % source nodes
t_un = [2 3 3 4 6 5 6 6]; % target nodes
w_un = [1 1 1 1 1 1 1 1]; % weights 
names_un = {'1' '2' '3' '4' '5' '6'}; % node names
ABgraph = graph(s_un,t_un,w_un,names_un); % create directed graph
Di_un = degree(ABgraph); % in degrees
D_un = diag(Di_un); % diagonal in-degree matrix
A_un = full(adjacency(ABgraph)) % adjacency matrix
LAB = laplacian(ABgraph); % Laplacian matrix


s_co = [1 1 1 1 1 2 2 2 2 3 3 3 4 4 5]; % source nodes
t_co = [2 3 4 5 6 3 4 5 6 4 5 6 5 6 6]; % target nodes
w_co = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ]; % weights 
%names_co = {'1' '2' '3' '4' '5' '6'}; % node names
ACgraph = graph(s_co,t_co,w_co) % create directed graph
Di_co = degree(ACgraph); % in degrees
D_co = diag(Di_co); % diagonal in-degree matrix
A_co = full(adjacency(ACgraph)) % adjacency matrix
LAC = laplacian(ACgraph) % Laplacian matrix


s_dt = [1 1 2 3 3]; % source nodes
t_dt = [2 3 4 5 6]; % target nodes
w_dt = [1 1 1 1 1]; % weights 
names_dt = {'1' '2' '3' '4' '5' '6'}; % node names
ADgraph = digraph(s_dt,t_dt,w_dt,names_dt) % create directed graph
Di_dt = indegree(ADgraph); % in degrees
D_dt = diag(Di_dt); % diagonal in-degree matrix
A_dt = full(adjacency(ADgraph)); % adjacency matrix
L_dt=D_dt-A_dt; % Laplacian matrix

s_us = [1 1 1 1 1]; % source nodes
t_us = [2 3 4 5 6]; % target nodes
w_us = [1 1 1 1 1]; % weights 
names_us = {'1' '2' '3' '4' '5' '6'}; % node names
AEgraph = graph(s_us,t_us,w_us,names_us); % create directed graph
Di_us = degree(AEgraph); % in degrees
D_us = diag(Di_us); % diagonal in-degree matrix
A_us = full(adjacency(AEgraph)) % adjacency matrix
LAE = laplacian(AEgraph); % Laplacian matrix

s_ds = [1 1 1 1 1]; % source nodes
t_ds = [2 3 4 5 6]; % target nodes
w_ds = [1 1 1 1 1]; % weights 
names_ds = {'1' '2' '3' '4' '5' '6'}; % node names
AFgraph = digraph(s_ds,t_ds,w_ds,names_ds); % create directed graph
Di_ds = indegree(AFgraph); % in degrees
D_ds = diag(Di_ds); % diagonal in-degree matrix
A_ds = full(adjacency(AFgraph)); % adjacency matrix
L_ds=D_ds-A_ds; % Laplacian matrix

s_u6c = [1 2 3 4 5 6]; % source nodes
t_u6c = [2 3 4 5 6 1]; % target nodes
w_u6c = [1 1 1 1 1 1]; % weights 
% names_u6c = {'1' '2' '3' '4' '5' '6'}; % node names
AGgraph = graph(s_u6c,t_u6c,w_u6c); % create directed graph
Di_u6c = degree(AGgraph); % in degrees
D_u6c = diag(Di_u6c); % diagonal in-degree matrix
A_u6c = full(adjacency(AGgraph)) % adjacency matrix
LAE = laplacian(AGgraph); % Laplacian matrix

s_d6s = [1 2 3 4 5 6]; % source nodes
t_d6s = [2 3 4 5 6 1]; % target nodes
w_d6s = [1 1 1 1 1 1]; % weights 
% names_d6s = {'1' '2' '3' '4' '5' '6'}; % node names
AHgraph = digraph(s_d6s,t_d6s,w_d6s); % create directed graph
Di_d6s = indegree(AHgraph); % in degrees
D_d6s = diag(Di_d6s); % diagonal in-degree matrix
A_d6s = full(adjacency(AHgraph)); % adjacency matrix
L_d6s=D_d6s-A_d6s; % Laplacian matrix

s_u5 = [1 2 3 4 5]; % source nodes
t_u5 = [2 3 4 5 6]; % target nodes
w_u5 = [1 1 1 1 1]; % weights 
names_u5 = {'1' '2' '3' '4' '5' '6'}; % node names
AIgraph = graph(s_u5,t_u5,w_u5,names_u5); % create directed graph
Di_u5 = degree(AIgraph); % in degrees
D_u5 = diag(Di_u5); % diagonal in-degree matrix
A_u5 = full(adjacency(AIgraph)) % adjacency matrix
LAE = laplacian(AIgraph); % Laplacian matrix

figure
subplot(3,3,1);
plot(AAgraph)
set(gca,'xtick',[])
set(gca,'ytick',[])

subplot(3,3,2);
plot(ABgraph)
set(gca,'xtick',[])
set(gca,'ytick',[])

subplot(3,3,3);
plot(ACgraph, 'NodeLabel',{})
set(gca,'xtick',[])
set(gca,'ytick',[])

subplot(3,3,4);
plot(ADgraph)
set(gca,'xtick',[])
set(gca,'ytick',[])

subplot(3,3,5);
plot(AEgraph, 'Layout', 'force')
set(gca,'xtick',[])
set(gca,'ytick',[])

subplot(3,3,6);
plot(AFgraph, 'Layout', 'force')
set(gca,'xtick',[])
set(gca,'ytick',[])

subplot(3,3,7);
plot(AGgraph, 'NodeLabel',{})
set(gca,'xtick',[])
set(gca,'ytick',[])

subplot(3,3,8);
plot(AHgraph, 'NodeLabel',{})
set(gca,'xtick',[])
set(gca,'ytick',[])

subplot(3,3,9);
plot(AIgraph, 'Layout', 'circle')
set(gca,'xtick',[])
set(gca,'ytick',[])
