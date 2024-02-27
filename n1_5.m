% построим различные графики функций в одном графическом окне (в одной системе координат)
xx = -3*pi:0.01:3*pi;
yya = (sqrt(3)/4)*sin(3*xx).*cos(2*xx);
yyb = (sin(3*xx - 5*pi/11) - sqrt(8)-3*pi)/(exp(-2)+4);
yyc = (sqrt(5)/exp(1))*xx.^2;
yyd = -(sqrt(8*(xx+0.1*pi).^2))/5 + 2*pi;
plot(xx,[yyb; yya; yyc; yyd])