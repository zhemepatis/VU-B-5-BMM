%% clearing old values, closing figures
clc, clear, close all
addpath('../utils');
addpath('numerical-methods/');

% defining function
f = @(t, u) exp(t) .* log(2 .* u + t) + t;
t_span = [0, 1];
initial_condition = 1; % u(0) = 1

% solving differential equation using standard MATLAB methods
ode45_results = ode45(f, t_span, initial_condition);

% solving differential equation using Runge-Kutta method
rk_results1 = runge_kutta_method(f, 0.1, 1);
rk_results2 = runge_kutta_method(f, 0.05, 1);

%% plotting
figure(1);
plot_prep([-1, 2.5], [0.75, 4.25]);
hold on;

% plotting ode45 results
graph = plot(ode45_results.x, ode45_results.y);
graph.LineStyle = '-';
graph.LineWidth = 1.8;

% plotting Runge-Kutta method results
t_values = rk_results1(1, :);
y_values = rk_results1(2, :);
y_2tau = y_values(end); % saving for error evaluation

graph = scatter(t_values, y_values, 60);
graph.Marker = 'square';
graph.MarkerFaceColor = '#e5c5c5';
graph.MarkerEdgeColor = '#A0526D';


t_values = rk_results2(1, :);
y_values = rk_results2(2, :);
y_tau = y_values(end); % saving for error evaluation

graph = scatter(t_values, y_values, 40);
graph.LineWidth = 1.5;
graph.Marker = 'x';
graph.MarkerEdgeColor = '#4B0082';

hold off;

%% evaluating approximation
error = runge_approx(y_2tau, y_tau, 4);
disp("error = " + num2str(error))