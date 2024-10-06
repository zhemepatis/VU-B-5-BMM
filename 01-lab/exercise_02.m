%% clearing old values, closing figures
clc, clear, close all

%% solving differential equation
syms y(x);
equation = x * diff(y, x) == y - y^3/x^2;
solution = dsolve(equation);

disp(solution);

%% plotting
f1 = matlabFunction(solution(1));
f2 = matlabFunction(solution(2));
f3 = matlabFunction(solution(3));

% preparation
figure(1)
axis equal; hold on;

xline(0, 'HandleVisibility', 'off'); hold on;
yline(0, 'HandleVisibility', 'off'); hold on;

xlim([-50 500]);
ylim([-200 200]);

grid on;

% plotting graph of MATLAB solution
colors = lines(5);

for C_value = (1:4)
    x_values = ((exp(C_value) + 0.1):0.1:1000);

    graph = plot(x_values, f1(C_value, x_values)); hold on;
    graph.Color = colors(C_value, :);
    graph.LineStyle = '-';
    graph.LineWidth = 1.8;
    graph.DisplayName = "y(x), C_1 = " + num2str(C_value);

    graph = plot(x_values, f2(C_value, x_values)); hold on;
    graph.Color = colors(C_value, :);
    graph.LineStyle = '-';
    graph.LineWidth = 1.8;
    graph.HandleVisibility = 'off';
end

legend('show');