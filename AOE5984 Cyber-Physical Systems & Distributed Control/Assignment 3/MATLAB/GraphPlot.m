%% #### -------------------------------------------------------------- #### 
%% George Kontoudis, Ph.D. Student, gpkont@vt.edu, www.georgekontoudis.com              
%% Virginia Tech, Department of Mechanical Engineering                         
%% AOE 5984: Cyber-Physical Systems & Distributed Control      
%% Assignment 3, Double-Integrator Consensus  
%% Graph description and plot
%% #### -------------------------------------------------------------- #### 
clear all;
close all;
clc;
%% #### -------------------------------------------------------------- #### 
s_dt = [1 1 2 2 3 4 5 6]; % source nodes
t_dt = [2 3 3 4 5 6 6 2]; % target nodes
w_dt = [1 1 1 1 1 1 1 1]; % weights 
names_dt = {'0' '1' '2' '3' '4' '5'}; % node names
ADgraph = digraph(s_dt,t_dt,w_dt,names_dt) % create directed graph
Di_dt = indegree(ADgraph); % in degrees

figure (1)
plot(ADgraph)
set(gca,'xtick',[])
set(gca,'ytick',[])