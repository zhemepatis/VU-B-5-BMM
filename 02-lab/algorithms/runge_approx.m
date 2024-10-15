function error = runge_approx(y_2tau, y_tau, p)
    error = abs(y_2tau - y_tau) / (2^p - 1);
end