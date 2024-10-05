clc, clear, close all

% solving differential equation
syms y(x);
equation = x * diff(y, x) == y - y^3/x^2;
solution = dsolve(equation);

disp(solution);

% preparing to plot graphs
f1 = matlabFunction(solution(1))
x_values = 7:0.001:1000;
C1 = 2;

y_values = f1(C1, x_values);
y_real = real(y_values);
y_imag = imag(y_values);

%% plotting
figure(1)

% plotting axes
% xline(0); hold on; 
% yline(0); hold on;

% xlabel('x');
% ylabel('y');

% grid on; hold on;

% %% plotting graphs
% graph = plot(x_values, y_real);
% graph.Color = '#07bdfa';
% graph.LineStyle = '-';
% graph.LineWidth = 1.8;

% graph = plot(x_values, y_imag);
% graph.Color = 'red';
% graph.LineStyle = '-';
% graph.LineWidth = 1;