function selected_pairs = runge_kutta_method(f, interval, tau)
    left_end = interval(1);
    right_end = interval(2);
    round_num = right_end / tau;

    t_n = 0;
    y_n = 1;

    selected_pairs = [];
    for i = 0:round_num
        k1 = f(t_n, y_n)
        k2 = f(t_n + tau/2, y_n + k1*tau/2);
        k3 = f(t_n + tau/2, y_n + k2*tau/2);
        k4 = f(t_n + tau, y_n + k3*tau);

        y_n = y_n + (k1 + 2*k2 + 2*k3 + k4)*tau/6;
        selected_pairs = [selected_pairs; t_n, y_n];
        
        t_n = t_n + tau;
    end
end