%% LABORATORIO 01 - SCA   [PREGUNTA 03] 
%
%       Jhoel René Mamani Huanca
%       Denilson Vilcapaza Goyzueta
%       GRUPO: A
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 03. Linealizar el modelo de péndulo y obtener controladores PIDs
%      control posición y ángulo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc, clear all, close all;
 

M = 2; m = 0.1; l = 0.5; g = 9.8; I = 0; b=0;

% Funcion de Transeferencia
numtf = [1];
dentf = [M*l 0 -(M+m)*g];
G=tf(numtf, dentf) %% Funcion de transferencia L.A. Angulo

s = tf('s');

%numtf2 = [M*l 0 -(M+2*m)*g];
numtf2 = [M*l 0 -(M)*g];
dentf2 = [M*M*l 0 -M*(M+m)*g 0 0];
G2=tf(numtf2, dentf2) %% Funcion de transferencia L.A. Posicion

%figure(1)
%rlocus(G)

%  PID

Kp = 84.35625;
Ki = 55.003;
Kd = 6.25;

%PID = (Kd*s^2+Kp*s+Ki)/s;

C = pid (Kp, Ki, Kd);
T = feedback(G,C)
figure(1)
rlocus(T) % Para ver Lugar de raices con el PID polos zeros
t=0:0.01:7;
figure(2)
impulse(T,t) % Respuesta
axis([0, 2.5, -0.2, 0.2]);
title({'Respuesta péndulo \theta ';' PID : Kp = 84.35625, Ki = 55.003, Kd = 6.25'});

% Kp2 = 43.351;
% Ki2 = 24.408;
% Kd2 = 7.772;


Kp2 = -7.0559;
Ki2 = -0.61746;
Kd2 = -20.1577;

%%C2 = pid (Kp2, Ki2, Kd2);
%%T2 = feedback(G2,C2)
%%
%%t2=0:0.01:120;
%%figure(3)
%%impulse(T2,t2)
%%axis([0, 30, -0.05, 10]);
%%title({'Respuesta carro';' PID : Kp = 43.351, Ki = 24.408, Kd = 8.772'});




q = (M+m)*(I+m*l^2)-(m*l)^2;

P_cart = (((I+m*l^2)/q)*s^2 - (m*g*l/q))/(s^4 + (b*(I + m*l^2))*s^3/q - ((M + m)*m*g*l)*s^2/q - b*m*g*l*s/q);




numm = P_cart;
denn = 1+G*C;
GG = numm/denn;
%pidTuner (P_cart, C2)

C3 = pid (100, 1, 20);
%T3 = feedback(P_cart,C3)
T3 = feedback(1,G*C3)*P_cart;

t3=0:0.01:10;
figure(4)
impulse(T3,t3)

axis([0, 2.5, -0.05, 0.05]);
title({'Respuesta carro';' X '});


