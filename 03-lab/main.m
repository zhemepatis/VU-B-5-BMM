%% clearing old values, closing figures
clc, clear, close all
addpath('../utils');

%% defining variables, equations
syms x(t) t

equation = diff(x, t, 2) + x == 10*sin(3*t) - 10*cos(3*t);

%% searching generic solution
generic_solution = dsolve(equation);
generic_solution = simplify(generic_solution);

disp("Generic solution: ");
disp(generic_solution);

%% solving Cauchy problem
cond1 = x(0) == 0;
Dx = diff(x, t);
cond2 = Dx(0) == 1;
conditions = [cond1, cond2];

cauchy_solution = dsolve(equation, conditions);
cauchy_solution = simplify(cauchy_solution);

disp("Cauchy solution: ");
disp(cauchy_solution);

%% plotting the answer
figure(1);
plot_prep([0, 20], [-7, 7]);

hold on;

graph = fplot(cauchy_solution, [0, 20]);
graph.DisplayName = "x(t)";
graph.LineStyle = '-';
graph.LineWidth = 1.5;

hold off;