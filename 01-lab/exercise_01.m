%% clearing old values, closing figures
clc, clear, close all
addpath('../utils');

syms y(x) C
equation = x * sqrt(3+y^2) * diff(x) + 2 * y * sqrt(1+x^2) * diff(y(x)) == 0;
solution = dsolve(equation)

%% plotting first solution
figure(1)
plot_prep([-25 25], [-20 20]);
hold on;

C_values = (-1:2);
func_num = length(C_values);
colors = lines(func_num);
for i = (1:func_num)
    C_value = C_values(i);

    syms_func = subs(solution(1), 'C1', C_value);
    func = matlabFunction(syms_func);

    graph = fplot(func);
    graph.Color = colors(i, :);
    graph.LineStyle = '-';
    graph.LineWidth = 1.8;
    graph.DisplayName = "y(x), C_1 = " + num2str(C_value);
end

hold off

%% plotting second solution
figure(2)
plot_prep([-25 25], [-20 20]);
hold on;

C_values = (-1:2);
func_num = length(C_values);
colors = lines(func_num);

for i = (1:func_num)
    C_value = C_values(i);

    syms_func = subs(solution(2), 'C1', C_value);
    func = matlabFunction(syms_func);

    graph = fplot(func);
    graph.Color = colors(i, :);
    graph.LineStyle = '-';
    graph.LineWidth = 1.8;
    graph.DisplayName = "y(x), C_1 = " + num2str(C_value);
end

hold off

%% plotting third solution
figure(3)
plot_prep([-2 2], [-2 2]);
hold on;

func = solution(3);
real_part = real(func);
imag_part = imag(func);

graph = plot(real_part, imag_part);
graph.Marker = ".";
graph.MarkerSize = 10;
graph.Color = "#622f75";
graph.DisplayName = "y = -3^(1/2)*1i";

hold off;

%% plotting third solution
figure(4)
plot_prep([-2 2], [-2 2]);
hold on;

func = solution(4);
real_part = real(func);
imag_part = imag(func);

graph = plot(real_part, imag_part);
graph.Marker = ".";
graph.MarkerSize = 10;
graph.Color = "#622f75";
graph.DisplayName = "y = 3^(1/2)*1i";

hold off;