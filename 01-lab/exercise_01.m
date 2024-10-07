%% clearing old values, closing figures
clc, clear, close all
addpath('utils');

syms y(x) C
equation = x * sqrt(3+y^2) * diff(x) + 2 * y * sqrt(1+x^2) * diff(y(x)) == 0;
solution = dsolve(equation)

%% preparation for plotting
f1 = matlabFunction(solution(1));
f2 = matlabFunction(solution(2));
f3 = matlabFunction(solution(3));
f4 = matlabFunction(solution(4));

figure(1)
plot_prep([-25 25], [-20 20]);

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
