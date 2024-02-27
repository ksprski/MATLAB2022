% Постройте графики функций 2sin(-5x), 3cos(0.2x) в одной системе координат.
% Переменная x изменяется от -6π до 6π с шагом 0.01.
x = -6*pi:0.01:6*pi;
ya = 2*sin(-5*x).*cos(-5*x)
yb = 3*cos(0.2*x);
plot(x,[ya; yb])