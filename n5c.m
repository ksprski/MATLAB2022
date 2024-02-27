b = 1; 
dc = 0.22; 
da = 0.89; 
N1= 943187;
N2 = 2932312;
N3 = 9005069;
N4 = 2539419;
N = [N1; N2; N3; N4];

L = [ (1 - dc/100)*5/6, 0, b/100, 0; (1 - dc/100)*1/6, 13/14, 0, 0; 0, 1/14, 39/40, 0; 0, 0, 1/40, (1 - da/100)*9/10 ];

for n = 1:100
    N(:, n + 1) = L * N(:, n);
end

figure(1)
years = 2022:2122;
subplot(3,1,1)
plot(years,sum(N))
title('Regress in total population')
xlabel('Year')
ylabel('People')

subplot(3,1,2)
plot(years, N)
title('Regress in every age group')
xlabel('Year')
ylabel('People')
legend('Infant', 'Teen', 'Adult', 'Elderly')

subplot(3,1,3)
plot(years, N(3, :))
title('Regress in adult group')
xlabel('Year')
ylabel('People')