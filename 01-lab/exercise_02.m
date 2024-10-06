%% clearing old values, closing figures
clc, clear, close all
addpath('utils');

%% solving differential equation
syms y(x);
equation = x * diff(y, x) == y - y^3/x^2;
solution = dsolve(equation);

disp(solution);

%% preparation for plotting
f1 = matlabFunction(solution(1));
f2 = matlabFunction(solution(2));
f3 = matlabFunction(solution(3));

figure(1)
plot_prep([-10 30], [-15 15]);

%% plotting graph of MATLAB solution
C_values = (-1:2);
func_num = length(C_values);
colors = lines(func_num);

for i = (1:func_num)
    C_value = C_values(i);
    x_values = ((exp(C_value) + 0.1):0.1:1000);

    graph = plot(x_values, f1(C_value, x_values)); hold on;
    graph.Color = colors(i, :);
    graph.LineStyle = '-';
    graph.LineWidth = 1.8;
    graph.DisplayName = "y(x), C_1 = " + num2str(C_value);

    graph = plot(x_values, f2(C_value, x_values)); hold on;
    graph.Color = colors(i, :);
    graph.LineStyle = '-';
    graph.LineWidth = 1.8;
    graph.HandleVisibility = 'off';
end

% preparation
fp1 = @(C, x) (x/2) .* sqrt(2 ./ (log(abs(x)) - C));
fp2 = @(C,x) -(x/2) .* sqrt(2 ./ (log(abs(x)) - C));
fp3 = 0;

figure(2);
plot_prep([-50 500], [-200 200]);

%% plotting graph of on-paper solution
C_values = (-1:2);
func_num = length(C_values);
colors = lines(func_num);

for i = (1:func_num)
    C_value = C_values(i);
    l_end = (-exp(C_value) - 500):0.1:(-exp(C_value) - 0.1);
    r_end = (exp(C_value) + 0.1):0.1:(exp(C_value) + 500);

    graph = plot(l_end, fp1(C_value, l_end)); hold on;
    graph.Color = colors(i, :);
    graph.LineStyle = '-';
    graph.LineWidth = 1.8;
    graph.DisplayName = "y(x), C_1 = " + num2str(C_value);

    graph = plot(r_end, fp1(C_value, r_end)); hold on;
    graph.Color = colors(i, :);
    graph.LineStyle = '-';
    graph.LineWidth = 1.8;
    graph.HandleVisibility = 'off';

    graph = plot(l_end, fp2(C_value, l_end)); hold on;
    graph.Color = colors(i, :);
    graph.LineStyle = '-';
    graph.LineWidth = 1.8;
    graph.HandleVisibility = 'off';

    graph = plot(r_end, fp2(C_value, r_end)); hold on;
    graph.Color = colors(i, :);
    graph.LineStyle = '-';
    graph.LineWidth = 1.8;
    graph.HandleVisibility = 'off';
end