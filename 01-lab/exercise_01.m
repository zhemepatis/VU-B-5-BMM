clc, clear

syms y(x);
equation = x*sqrt(3 + y^2) + 2*y*sqrt(1 + x^2)*diff(y, x) == 0;
solution = dsolve(equation);

l_sol = latex(solution(1))
disp(l_sol)