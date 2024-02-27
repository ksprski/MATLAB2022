function linear_interp()
    clf 
    axis([-1 1 -1 1])
    title('Enter 2 POINTS') 
    hold on
    A=ginput(1); 
    plot(A(1),A(2),'.b','MarkerSize',25) 
    text(A(1),A(2)+.1,'A','Color','b','FontWeight','bold'); 
    B=ginput(1); 
    plot(B(1),B(2),'.g','MarkerSize',25) 
    text(B(1),B(2)+.1,'B','Color','g','FontWeight','bold'); 

    blue = [0 0 1];
    green = [0 1 0];
    color = [];

    linear = @(A, B, t) (1-t).*A+t.*B;

    t=0:0.01:1;
    i = 1;
    S=linear(A(1),B(1),t); 
    S(2,:)=linear(A(2), B(2),t);  
    for t=0:0.01:1
        color(i, :) = linear(blue, green, t);
        i = i+1;
    end
    
    for n=1:(size(S,2) - 1)
     h=plot(S(1,n),S(2,n),'.m','MarkerSize',20, 'MarkerEdgeColor', color(n, :));
     vect = n:(n+1);
     plot(S(1,vect),S(2,vect),'-m', 'Color', color(n, :));
     drawnow 
     pause(.01) 
     if(n~=1)||(n~=size(S,2)) 
     set(h,'Visible','Off') 
     clear h
     end
    end
end