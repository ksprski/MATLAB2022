a1=1.2; a2=1.0; w2=1.0; f2 = 5*pi/4; f1 = 3*pi/4; %дополнительно задалим начальные фазы f1, f2
t=0:0.1:19.5; 
x=a1*cos(w2*t + f1);
w1=1.25:0.25:2.0; 
for k=1:4
    y=a2*cos(w1(k)*t + f2); 
    s=['w1/w2=' num2str(w1(k))]; 
    subplot(2,2,k); plot(x,y); title(s);
end; 


