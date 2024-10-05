clc, clear

% solving differential equation
syms y(x);
equation = diff(y, x) - y/x == x * exp(x);
solution = dsolve(equation);

disp("General differential equation solution");
disp(solution)

% solving Cauchy condition
syms C1;
cauchy_y = 0;
cauchy_x = 1;

cauchy_condition = subs(solution, 'x', cauchy_x) == cauchy_y;
C1 = solve(cauchy_condition, C1);
cauchy_condition_solution = subs(solution, 'C1', C1);

disp("Cauchy condition solution");
disp(cauchy_condition_solution);