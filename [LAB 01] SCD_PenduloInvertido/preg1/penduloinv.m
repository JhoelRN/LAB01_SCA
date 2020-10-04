function dx = penduloinv(t,x,u,m,M,l,g,mu)
  
  % ESTADOS
  x1 = x(1);
  x2 = x(2);
  x3 = x(3);
  x4 = x(4);
  
  % Ecuaciones diferenciales
  dx1 = x2; % theta
  dx2 = ( u*cos(x1) - (M+m)*g*sin(x1) + (m*l*(cos(x1)*sin(x1))*x2^2) ) / (m*l*(cos(x1))^2 - (M+m)*l);
  %dx2 = (-m*l*sin(x(1))*cos(x(1))*x(2)^2+(m+M)*g*sin(x(1))-cos(x(1))*F)/((m+M)*l - m*l*cos(x(1))^2);
  dx3 = x4; % x
  dx4 =  ( u + m*l*(sin(x1))*(x2)^2 - m*g*cos(x1)*sin(x1)  )  /  (M + m - m*(cos(x1))^2);
 % dx4 = (m*l*sin(x(1))*x(2)^2 - m*g*sin(x(1))*cos(x(1))+F)/(m+M - m*cos(x(1))^2);
  
dx = [dx1,dx2,dx3,dx4];
