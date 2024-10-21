%% clearing old values, closing figures
clc, clear, close all
addpath('../utils');
addpath('numerical-methods/');

% defining function
f = @(t, u) exp(t) .* log(2 .* u + t) + t;
t_span = [0, 1];
initial_point = [0, 1]; % u(0) = 1

% solving differential equation using standard MATLAB methods
ode45_results = ode45(f, t_span, initial_point(2));

% solving differential equation using 2nd order Runge-Kutta method
rk_results = runge_kutta_method(f, initial_point, 0.1, 1);
rk_2o_results = runge_kutta_2o_method(f, initial_point, 0.1, 1);

%% plotting
figure(1);
plot_prep([-1, 2.5], [0.75, 4.25]);
xlabel('t');
ylabel('u');

hold on;

% plotting RK 4o results
t_values = rk_results(1, :);
y_values = rk_results(2, :);

graph = plot(t_values, y_values);
graph.Marker = 'square';
graph.MarkerFaceColor = '#e5c5c5';
graph.MarkerEdgeColor = '#A0526D';
graph.DisplayName = "Rungės-Kuto 4-pakopis";

% plotting RK 2o results
t_values = rk_2o_results(1, :);
y_values = rk_2o_results(2, :);

graph = plot(t_values, y_values);
graph.LineWidth = 1.5;
graph.Marker = 'x';
graph.MarkerEdgeColor = '#4B0082';
graph.DisplayName = "Rungės-Kuto 2-pakopis";

hold off;