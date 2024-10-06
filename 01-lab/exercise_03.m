%% clearing old values, closing figures
clc; clear; close all;

%% solving the differential equation
syms y(x);
equation = diff(y, x) - y/x == x * exp(x);
solution = dsolve(equation);

% solving Cauchy condition
syms C1;
cauchy_y = 0;
cauchy_x = 1;

cauchy_condition = subs(solution, x, cauchy_x) == cauchy_y;
C1_value = solve(cauchy_condition, C1);
cauchy_condition_func = subs(solution, "C1", C1_value);

%% plotting
f = matlabFunction(cauchy_condition_func);

% preparation
figure(1)
axis equal; hold on;

xline(0); hold on;
yline(0); hold on;

xlim([-1 2]);
ylim([-1 2]);

grid on;

% plotting graph
graph = fplot(f); hold on;
graph.LineWidth = 1.5;

% plotting Cauchy point
point = plot(cauchy_x, cauchy_y, "."); hold on;
point.MarkerSize = 10;
point.Color = "#622f75";

datatip(point);