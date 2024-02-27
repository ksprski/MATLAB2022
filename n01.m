b = 1.83; 
dc = 0.2; 
da = 0.8; 
N1= 943187;
N2 = 2932312;
N3 = 9005069;
N4 = 1539419;
N = [N1; N2; N3; N4];

L = [ (1 - dc/100)*5/6, 0, b/100, 0; (1 - dc/100)*1/6, 13/14, 0, 0; 0, 1/14, 39/40, 0; 0, 0, 1/40, (1 - da/100)*9/10 ];

for n = 1:100
    N(:, n + 1) = L * N(:, n);
end

figure(1)
years = 2022:2122;
subplot(2,1,1)
plot(years,sum(N))
title('Population in total')
xlabel('Year')
ylabel('People')

subplot(2,1,2)
plot(years, N)
title('Population in every age group')
xlabel('Year')
ylabel('People')
legend('Infant', 'Teen', 'Adult', 'Elderly')


