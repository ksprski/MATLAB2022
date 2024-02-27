%Задание 4. Напишите m-функцию, позволяющую пользователю задавать с помощью мыши
% два ломаные A и B с одинаковым количеством вершин, после чего будет осуществляться
% твининг фигуры A в фигуру B с отображением исходной фигуры A, целевой фигуры B и
% текущего промежуточного изображения (твина) между A и B. Входной параметр m-функции
% задает количество вершин ломаных.

function line_tween(vert_num)
% vert_num - число вершин ломаной

clf
axis([-1 1 -1 1]) 
title('Задайте ломаные их вершинами') 
hold on

Ax = []; Ay = [];
[x_t,y_t] = ginput(1);
Ax(1) = x_t;
Ay(1) = y_t;
plot(Ax,Ay,'.r','MarkerSize', 25)
for i = 2:vert_num
    [x_t,y_t] = ginput(1);
    Ax(i) = x_t;
    Ay(i) = y_t;
    plot([Ax(end),Ax(end-1)], [Ay(end),Ay(end - 1)],'r-','LineWidth', 0.4)
    plot(Ax,Ay,'.r','MarkerSize', 25)
end
text(sum(Ax)/vert_num, sum(Ay)/vert_num,'A','Color','r','FontWeight','bold')

Bx = []; By = [];
[x_t,y_t] = ginput(1);
Bx(1) = x_t;
By(1) = y_t;
plot(Bx,By,'.b','MarkerSize', 25)
for i = 2:vert_num
    [x_t,y_t] = ginput(1);
    Bx(i) = x_t;
    By(i) = y_t;
    plot([Bx(end),Bx(end-1)], [By(end),By(end - 1)],'b-','LineWidth', 0.4)
    plot(Bx,By,'.b','MarkerSize', 25)
end
text(sum(Bx)/vert_num, sum(By)/vert_num,'B','Color','b','FontWeight','bold')

A =[Ax; Ay]; B = [Bx; By];
step = 0.01;
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

for n = 1:size(T,3)
    h=plot(T(1,:, n), T(2,:, n),'g','LineWidth',0.4 , 'Color', color(n, :)); 
    p1 = plot(T(1, 1, n),T(2, 1, n),'.','MarkerSize', 25, 'MarkerEdgeColor',color(n, :));
    p2 = plot(T(1, end, n),T(2, end, n),'.','MarkerSize',25, 'MarkerEdgeColor',color(n, :));
    axis([-1 1 -1 1]) 
    drawnow 
    pause(.03) 
    if(n~=1)||(n~=size(S,2)) 
    set(h,'Visible','Off') 
    set(p1,'Visible','Off')
    set(p2,'Visible','Off')
    clear h
    end
end

end