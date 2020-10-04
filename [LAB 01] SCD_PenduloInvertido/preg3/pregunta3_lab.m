%% LABORATORIO 01 - SCA   [PREGUNTA 03] 
%
%       Jhoel René Mamani Huanca
%       GRUPO: A
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 03. Linealizar el modelo de péndulo y obtener controladores PIDs
%      control posición y ángulo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all; close all;
 

M = 2; m = 0.1; l = 0.5; g = 9.8;

% Funcion de Transeferencia
numtf = [1];
dentf = [M*l 0 -(M+m)*g];
G=tf(numtf, dentf)

s = tf('s');

numtf2 = [1 -19.6];
dentf2 = [2 0 -41.16 0 0];
G2=tf(numtf2, dentf2)

%figure(1)
%rlocus(G)

%  PID

Kp = 100;
Ki = 1;
Kd = 20;

%PID = (Kd*s^2+Kp*s+Ki)/s;

C = pid (Kp, Ki, Kd);
T = feedback(G,C);
t=0:0.01:10;
figure(2)
impulse(T,t)
axis([0, 2.5, -0.2, 0.2]);
title({'Respuesta péndulo';' PID : Kp = 100, Ki = 1, Kd = 20'});



%rlocus(T)

Kp2 = 85;
Ki2 = 15;
Kd2 = 20;



% C2 = pid (Kp2, Ki2, Kd2);
% T2 = feedback(G2,C2);
% t=0:0.01:10;
% figure()
% impulse(T2,t)
% axis([0, 2.5, -0.2, 0.2]);
% title({'Respuesta carro';' PID : Kp = 100, Ki = 1, Kd = 20'});













