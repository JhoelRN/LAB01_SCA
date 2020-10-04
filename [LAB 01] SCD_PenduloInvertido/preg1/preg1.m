%% LABORATORIO 01 - SCA   [PREGUNTA 01] 
%
%       Jhoel René Mamani Huanca
%       Denilson Vilcapaza Goyzueta
%       GRUPO: A
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 01. Sistema pendulo invertido(modelo no lineal) con ODE45
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

% definición de los valores del sistema 
M = 2; m = 0.1; l = 0.5; g = 9.8; u = 0.1; mu = 0; 

% condicion inicial
%x0 = [pi/4;0;0;0];
x0 = [1 0 0.01 0];

Tf = 6;   % tiempo final
T = [ 0:0.01: Tf]; % tiempo



%tspan=linspace(0,50,1000);
%tspan=linspace(0,5,1000);

[ts,x] = ode45(@(t,x)penduloinv(t,x,u,m,M,l,g,mu), T, x0);


subplot(2,2,1)
plot(ts,x(:,1))
title('\theta')

subplot(2,2,2)
plot(ts,x(:,2))
title('\theta •')

subplot(2,2,3)
plot(ts,x(:,3))
title('x')

subplot(2,2,4)
plot(ts,x(:,4))
title('x •')

figure(2)
plot(ts,x)

lgd=legend('\theta','\theta •','x','x •','location','best');
%title(lgd,'PENDULO INVERTIDO')
title('PENDULO INVERTIDO'); grid 

















