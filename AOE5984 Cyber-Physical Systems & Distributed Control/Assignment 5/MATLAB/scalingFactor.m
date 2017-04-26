%% #### -------------------------------------------------------------- #### 
%% George Kontoudis, Ph.D. Student, gpkont@vt.edu, www.georgekontoudis.com              
%% Virginia Tech, Department of Mechanical Engineering                         
%% AOE 5984: Cyber-Physical Systems & Distributed Control      
%% Project, Cooperaive Mobile Manipulation without Communication 
%% Scaling Factor of Disturbances
%% #### -------------------------------------------------------------- #### 
clear all;
close all;
clc;

N=linspace(4,50,45);

for k=1:45
    sf(k)=(2*N(k))/(N(k)^2-N(k));
end

figure (1)
plot (N,sf, '--o')
axis([4 50 0 .5]);
xlabel('N');
ylabel('Scaling Down');