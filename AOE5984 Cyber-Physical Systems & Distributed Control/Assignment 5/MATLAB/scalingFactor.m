%% #### -------------------------------------------------------------- #### 
%% George Kontoudis, Ph.D. Student, gpkont@vt.edu, www.georgekontoudis.com              
%% Virginia Tech, Department of Mechanical Engineering                         
%% AOE 5984: Cyber-Physical Systems & Distributed Control      
%% Semester Project, Cooperative Mobile Manipulation without Communication 
%% Scaling Factor of Disturbances
%% #### -------------------------------------------------------------- #### 
clear all;
close all;
clc;

N=6:200;

for k=1:size(N,2)
    sf(k)=(2*N(k))/(N(k)^2-N(k));
end

figure (1)
plot (N,sf, '--o')
axis([4 200 0 .5]);
xlabel('N-robots');
ylabel('Scaling Disturbing Factor');