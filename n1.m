%Задание 1. Разработайте программу (m-сценарий), позволяющую пользователю задавать с 
%помощью мыши два отрезка A и B, после чего отобразите исходный отрезок A, целевой
%отрезок B и все промежуточные изображения (твины) между A и B при изменении параметра 
%t от 0 до 1 с заданным шагом. 
clf 
axis([-1 1 -1 1]) 
title('Задайте начальные и конечные точки отрезков') 
hold on
A1=ginput(1); 
plot(A1(1),A1(2),'.r','MarkerSize',25) 
text(A1(1),A1(2)+.1,'A1','Color','r','FontWeight','bold');

A2=ginput(1); 
plot(A2(1),A2(2),'.r','MarkerSize',25) 
text(A2(1),A2(2)+.1,'A2','Color','r','FontWeight','bold'); 
plot([A1(1),A2(1)], [A1(2), A2(2)], 'r','LineWidth', 0.3) 

B1=ginput(1); 
plot(B1(1),B1(2),'.b','MarkerSize',25) 
text(B1(1),B1(2)+.1,'B1','Color','b','FontWeight','bold'); 
B2=ginput(1); 
plot(B2(1),B2(2),'.b','MarkerSize',25) 
text(B2(1),B2(2)+.1,'B2','Color','b','FontWeight','bold'); 
plot([B1(1),B2(1)], [B1(2), B2(2)], 'b','LineWidth', 0.3) 

t=0:0.01:1;
A =[A1; A2].';
B =[B1; B2].';

step = input('Введите размер шага: ');

i = 1;
T = [];
red = [1 0 0]; 
blue = [0 0 1];
color = [];
for t=0:step:1
    if (t~=0)&&(t~=1)
        S=(1-t)*A(1, :)+t*B(1, :); 
        S(2,:)=(1-t)*A(2, :)+t*B(2, :);
        T(:,:,i) = S;
    end
    color(i, :) = red*(1-t) + blue*t;
    i = i + 1;
end

for n=1:size(T,3) 
    plot(T(1,:, n), T(2,:, n), '-', 'Color', color(n, :))
end