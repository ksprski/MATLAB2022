x = -1:0.01:1;
T = [ones(size(x)); x];
for n = 3:6
    T(n, :) = 2*x.*T(n-1, :) - T(n-2, :);
end
plot(x, T)