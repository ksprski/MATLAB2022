b = 2.55; 
dc = 0.1; 
da = 0.4; 
N1 = 1225167;
N2 = 2819231;
N3 = 8012811;
N4 = 2012903;
N = [N1; N2; N3; N4];

L = [ (1 - dc/100)*5/6, 0, b/100, 0; (1 - dc/100)*1/6, 13/14, 0, 0; 0, 1/14, 39/40, 0; 0, 0, 1/40, (1 - da/100)*9/10 ];

for n = 1:100
    N(:, n + 1) = L * N(:, n);
end

subplot(2,1,1)
years = 2022:2122;
plot(years,sum(N))
title('Stability in total population')
xlabel('Year')
ylabel('People')

subplot(2,1,2)
plot(years, N(3,:))
title('Stability in adult group')
xlabel('Year')
ylabel('People')