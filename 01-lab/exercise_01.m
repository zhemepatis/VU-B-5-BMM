%% clearing old values, closing figures
clc, clear, close all
addpath('utils');

syms y(x)
equation = diff(y, x) == -(x * sqrt(3 + y^2)) / (2 * y * sqrt(1 + x^2));
solution = dsolve(equation)