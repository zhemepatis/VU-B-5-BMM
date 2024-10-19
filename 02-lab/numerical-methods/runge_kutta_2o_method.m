function results = runge_kutta_2o_method(f, initial_point, tau, T)
    iter_num = T / tau - 1;
    
    t_n = initial_point(1);
    y_n = initial_point(2);

    t_val = [t_n];
    y_val = [y_n];
    for i = 0:iter_num
        k1 = f(t_n, y_n);
        k2 = f(t_n + tau, y_n + k1*tau);

        y_n = y_n + (k1 + k2)*tau/2;
        t_n = t_n + tau;

        t_val = [t_val, t_n];
        y_val = [y_val, y_n];
    end

    results = [t_val; y_val];
end