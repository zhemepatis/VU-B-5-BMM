function plot_prep(x_limits, y_limits)
    axis equal; hold on;

    xline(0, 'HandleVisibility', 'off'); hold on;
    yline(0, 'HandleVisibility', 'off'); hold on;

    xlim(x_limits);
    ylim(y_limits);

    xlabel('x'); hold on;
    ylabel('y'); hold on;

    grid on;
    legend();
end