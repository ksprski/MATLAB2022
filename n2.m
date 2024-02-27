%Задание 2. Разработайте программу (m-сценарий), позволяющую пользователю задавать с 
%помощью мыши два отрезка A и B, после чего выполните твининг отрезка A в отрезок B с 
% отображением исходного отрезка A, целевого отрезка B и текущего промежуточного 
% изображения (твина) между A и B при изменении параметра t от 0 до 1 с заданным шагом. 

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
A =[A1; A2].';B =[B1; B2].';

step = input('Введите размер шага: ');

i = 1;
T = [];
red = [1 0 0]; 
blue = [0 0 1];
color = [];
for t=0:step:1
    S=(1-t)*A(1, :)+t*B(1, :); 
    S(2,:)=(1-t)*A(2, :)+t*B(2, :);
    T(:,:,i) = S;
    color(i, :) = red*(1-t) + blue*t;
    i = i + 1;
end

for n=1:size(T,3) 
    h=plot(T(1,:, n), T(2,:, n),'LineWidth',0.4, 'Color', color(n, :)); 
    p1 = plot(T(1, 1, n),T(2, 1, n),'.','MarkerSize', 25, 'MarkerEdgeColor',color(n, :));
    p2 = plot(T(1, end, n),T(2, end, n),'.','MarkerSize',25, 'MarkerEdgeColor',color(n, :));
    axis([-1 1 -1 1]) 
    drawnow 
    pause(.05) 
    if(n~=1)||(n~=size(S,2)) 
    set(h,'Visible','Off') 
    set(p1,'Visible','Off')
    set(p2,'Visible','Off')
    clear h
    end
end