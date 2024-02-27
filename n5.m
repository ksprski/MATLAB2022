%Задание 5. Напишите программу (m-сценарий), в которой пользователь при помощи мыши
% интерактивно задает три точки A, B, C, затем выполняется квадратичная интерполяция и
% движение точки по кривой от точки A до точки C.

clf 
axis([-1 1 -1 1])
title('Enter 3 POINTS') 
hold on
A=ginput(1); 
plot(A(1),A(2),'.r','MarkerSize',25) 
text(A(1),A(2)+.1,'A','Color','r','FontWeight','bold'); 
B=ginput(1); 
plot(B(1),B(2),'.b','MarkerSize',25) 
text(B(1),B(2)+.1,'B','Color','b','FontWeight','bold'); 
C=ginput(1); 
plot(C(1),C(2),'.m','MarkerSize',25) 
text(C(1),C(2)+.1,'C','Color','m','FontWeight','bold'); 

blue = [0 0 1];
magenta = [1 0 1];
red = [1 0 0]; 
color = [];

square = @(A, B, C, t) (1-t).^2.*A+2*(1-t).*t.*B+t.^2.*C;

t=0:0.01:1; 
S=square(A(1), B(1), C(1), t); 
S(2,:)= square(A(2), B(2), C(2), t); 

i = 1;
for t=0:0.01:1
color(i, :) = square(red, blue, magenta, t);
i = i+1;
end

for n=1:(size(S,2)-1)
 h=plot(S(1,n),S(2,n),'.m','MarkerSize',20, 'MarkerEdgeColor', color(n, :));
 hold on
 vect = n:(n+1);
 plot(S(1,vect),S(2,vect),'-m', 'Color', color(n, :));
 drawnow 
 pause(.01) 
 if(n~=1)||(n~=size(S,2)) 
 set(h,'Visible','Off') 
 clear h
 end
end