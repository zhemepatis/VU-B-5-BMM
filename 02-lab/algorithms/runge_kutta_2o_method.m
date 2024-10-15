function results = runge_kutta_2o_method(f, tau, T)
    iter_num = T / tau - 1;

    t_n = 0;
    y_n = 1;

    t_val = [t_n];
    y_val = [y_n];
    for i = 0:iter_num
        k1 = f(t_n, y_n);
        k2 = f(t_n + tau/2, y_n + k1*tau/2);
        k3 = f(t_n + tau/2, y_n + k2*tau/2);
        k4 = f(t_n + tau, y_n + k3*tau);

        y_n = y_n + (k1 + 2*k2 + 2*k3 + k4)*tau/6;
        t_n = t_n + tau;

        t_val = [t_val, t_n];
        y_val = [y_val, y_n];
    end

    results = [t_val; y_val];
end