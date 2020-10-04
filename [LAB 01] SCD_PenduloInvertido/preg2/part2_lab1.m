
%% LABORATORIO 1 - SCA 
% APELLIDOS Y NOMBRE: Vilcapaza Goyzueta, Denilson Jean
%                     Mamani Huanca,Jhoel Rene


% GRUPO: A

%%
%PENDULO_NO_LINEAL_CASO_1 (RUNGE KUTTA)
clear;clc;
%Parametros
M = 2;
m = 1;
g = 9.8;
l = 0.5;
F = 0.5;
%Condiciones Iniciales
ang_ini = 30*pi/180;
vel_ang_ini = 0;
pos_ini = 2;
veloc_ini = 0;
x0=[ang_ini,vel_ang_ini,pos_ini,veloc_ini]; 

%tiempos
t0=0; %tiempo inicial
tf=60; %tiempo final
h=0.001; %pasos 
 


pend_inv = @(t,x)[x(2);(m*l*sin(x(1))*cos(x(1))*x(2)-(m+M)*g*sin(x(1))+cos(x(1))*F)/(-(m+M)*l + m*l*cos(x(1))^2);x(3);
                (m*l*sin(x(1))*x(2)^2 - m*g*sin(x(1))*cos(x(1))+F)/(m+M - m*cos(x(1))^2)];
  % Runge Kutta metodo de 4TO orden 
  
% t=linspace(0,60,500);
% k=t;
[t,xdo] = RK4(pend_inv,t0,tf,x0,h);
% f=t;
%Graficas
figure(1)
subplot(2,2,1); plot(t,xdo(:,1)), grid, title('angulo')
subplot(2,2,2); plot(t,xdo(:,2)), grid, title('velocidad angular')
subplot(2,2,3); plot(t,xdo(:,3)), grid, title('posicion')
subplot(2,2,4); plot(t,xdo(:,4)), grid, title('velocidad')


figure(2)
plot(t,xdo)















