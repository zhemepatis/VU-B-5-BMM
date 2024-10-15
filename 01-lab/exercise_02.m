%% clearing old values, closing figures
clc, clear, close all
addpath('../utils');

%% solving differential equation
syms y(x);
equation = x * diff(y, x) == y - y^3/x^2;
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

%% plotting spec solution
figure(3)
plot_prep([-25 25], [-20 20]);
hold on;

graph = fplot(solution(3)); hold on;
graph.Color = [0, 0, 0];
graph.LineStyle = '-';
graph.LineWidth = 1.8;
graph.DisplayName = "y = 0";

hold off

%% plotting first func on paper
syms C;
fp1 =  (2^(1/2)*x*(-1/(C - log(abs(x))))^(1/2))/2;
fp2 = -(2^(1/2)*x*(-1/(C - log(abs(x))))^(1/2))/2;

figure(4)
plot_prep([-25 25], [-20 20]);
hold on;

C_values = (-1:2);
func_num = length(C_values);
colors = lines(func_num);

for i = 1:func_num
    C_value = C_values(i);

    syms_func = subs(fp1, C, C_value);
    func = matlabFunction(syms_func);
    
    graph = fplot(func);
    graph.Color = colors(i, :);
    graph.LineStyle = '-';
    graph.LineWidth = 1.8;
    graph.DisplayName = "y(x), C_1 = " + num2str(C_value);
end

hold off;

%% plotting second func on paper
figure(5)
plot_prep([-25 25], [-20 20]);
hold on;

C_values = (-1:2);
func_num = length(C_values);
colors = lines(func_num);

for i = 1:func_num
    C_value = C_values(i);

    syms_func = subs(fp2, C, C_value);
    func = matlabFunction(syms_func);
    
    graph = fplot(func);
    graph.Color = colors(i, :);
    graph.LineStyle = '-';
    graph.LineWidth = 1.8;
    graph.DisplayName = "y(x), C_1 = " + num2str(C_value);
end

hold off;