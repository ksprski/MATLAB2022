% выведем три графика в различных графических окнах; 
% значения амплитуд и частот являются случайными числами
for i = 1:3
    w1 = round(rand, 1) + 1;
    w2 = round(2*rand + 1, 1);
    a1 = round(2*rand, 1);
    a2 = round(rand, 1) + 2;
    t = 0:0.01:25;
    x=a1*cos(w1*t);
    y=a2*cos(w2*t); 
    figure; %оператор для создания нового графического окна
    plot(x,y); 
end
