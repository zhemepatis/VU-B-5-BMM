%% clearing old values, closing figures
clc, clear, close all

addpath('../utils');

f = @(x, u) exp(x) .* log(2 .* u + x) + x;

results = runge_kutta_method(f, [0, 1], 0.1)