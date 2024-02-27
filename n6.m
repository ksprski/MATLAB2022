%Задание 6. Напишите самостоятельно формулу для кубической интерполяции с четырьмя
% точками. Напишите программу (m-сценарий), в которой пользователь при помощи мыши
% интерактивно задает четыре точки A, B, C, D, затем выполняется кубическая интерполяция и
% движение точки по кривой от точки A до точки D.

% используя выражение 1=((1-t)+t)^3 разобьем единицу на четыре части как
% (1-t)^3 + 3*(1-t)^2*t + 3*(1-t)*t^2 + t^3

    clf 
    axis([-1 1 -1 1])
    title('Enter 4 POINTS') 
    hold on
    A=ginput(1); 
    plot(A(1),A(2),'.g','MarkerSize',25) 
    text(A(1),A(2)+.1,'A','Color','g','FontWeight','bold'); 
    B=ginput(1); 
    plot(B(1),B(2),'.b','MarkerSize',25) 
    text(B(1),B(2)+.1,'B','Color','b','FontWeight','bold'); 
    C=ginput(1); 
    plot(C(1),C(2),'.m','MarkerSize',25) 
    text(C(1),C(2)+.1,'C','Color','m','FontWeight','bold'); 
    D=ginput(1); 
    plot(D(1),D(2),'.r','MarkerSize',25) 
    text(D(1),D(2)+.1,'D','Color','r','FontWeight','bold'); 
    
    T = [];
    green = [0 1 0];
    blue = [0 0 1];
    magenta = [1 0 1];
    red = [1 0 0]; 
    color = [];
    cubic = @(A, B, C, D, t) (1-t).^3.*A + 3*(1-t).^2.*t.*B + 3*(1-t).*t.^2.*C + t.^3.*D;

    t=0:0.01:1; 
    S=cubic(A(1),B(1),C(1),D(1),t); 
    S(2,:)=cubic(A(2),B(2),C(2),D(2),t); 
    i = 1;
    for t = 0:0.01:1
    color(i, :) = cubic(green,blue,magenta,red,t);
    i = i+1;
    end
    for n=1:(size(S,2)-1) 
     h=plot(S(1,n),S(2,n),'.m','MarkerSize',20, 'MarkerEdgeColor',color(n, :));
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
