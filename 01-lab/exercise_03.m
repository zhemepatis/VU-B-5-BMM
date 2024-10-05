clc, clear

syms y(x);
equation = diff(y, x) - y/x == x * exp(x);
solution = dsolve(equation);

disp(solution)
