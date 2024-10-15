%% clearing old values, closing figures
clc, clear, close all
addpath('../utils');
addpath('algorithms');

% defining function
f = @(t, u) exp(t) .* log(2 .* u + t) + t;
t_span = [0, 1];
initial_condition = 1; % u(0) = 1

% solving differential equation using standard MATLAB methods
ode45_results = ode45(f, t_span, initial_condition);

% solving differential equation using 2nd order Runge-Kutta method
rk_2o_results1 = runge_kutta_2o_method(f, 0.1, 1);
rk_2o_results2 = runge_kutta_2o_method(f, 0.05, 1);

%% plotting
figure(1);
plot_prep([-2.5, 2.5], [0, 5]);
hold on;

% plotting ode45 results
graph = plot(ode45_results.x, ode45_results.y);
graph.LineStyle = '-';
graph.LineWidth = 1.8;

% plotting 2nd order Runge-Kutta method results
t_values = rk_2o_results1(1, :);
y_values = rk_2o_results1(2, :);

graph = scatter(t_values, y_values);
graph.Marker = 'x';

t_values = rk_2o_results2(1, :);
y_values = rk_2o_results2(2, :);

graph = scatter(t_values, y_values);
graph.Marker = 'square';

hold off;