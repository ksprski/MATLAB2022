function plot(p)
% POLYNOM/PLOT PLOT(p) plots the polynom p.
r = max(abs(roots(p)));
if  ~r 
    r = 1;
end
if ~isempty(r)
    x = (-1.1:0.01:1.1)*r;
else
    x = (-1.1:0.01:1.1);
end
y = polyval(p,x);
if ~y
     y = zeros(size(x));
end
plot(x,y);
title(char(p))
grid on