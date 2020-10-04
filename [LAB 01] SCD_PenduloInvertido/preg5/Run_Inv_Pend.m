%% LABORATORIO 01 - SCA   [PREGUNTA 05] 
%
%       Jhoel René Mamani Huanca
%       Denilson Vilcapaza Goyzueta
%       GRUPO: A
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 03. Ruido Gaussiano
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;
%% Deefinicion de parametros:

m = 3; % 
g = 9.81; 
M = 10; 
l = 1.5; 
F1 = 0.001; % Magnitud de ruido plantaMagnitude of Plant White Noise
F2 = 0.001; % Magnitud de medida con ruido blanc

% Crear Modelo L.A
[A, B, C, D] = create_ol_sys(m, M, l, g)

% Observar y Control matricial
c = is_controllable(A, B);
o = is_observable(A, C);

%% LQR 
G = optimal_lqr(A, B, C, D);

%% Laso Cerrado Modelo
% Rudiso
Ac = A-B*G;
clSys = ss(Ac, B, C, D)
% Ruido
clSysN = op2cl_noise(Ac, B, C, D, F1, F2);
% condiciones iniciales
y_0 = 1.5; % 
dy_0 = 0; % 
theta_0 = -pi; % 
dtheta_0 = 0; % 
tf = 7; %
dt = 0.1; % 
% dt = tf/750; % 
live = 't'; % 
%SIMULAR 
[y, t, x] = sim_inv_pend(tf, dt, F1, F2, y_0, dy_0, theta_0, dtheta_0, clSysN, live, l, G, B);