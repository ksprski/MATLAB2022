% Задание 2.33
A = randi(30, 5, 6)
B = randi(20, 3, 2)

S = A(2:4, 3:6)
A(2:end-1, 4:end-1) = B
D = [A zeros(5, 5); zeros(6, 6) A']
