function plot_prep(x_limits, y_limits)
    hold on;
    axis equal;

    xline(0, 'HandleVisibility', 'off');
    yline(0, 'HandleVisibility', 'off');

    xlim(x_limits);
    ylim(y_limits);

    xlabel('x');
    ylabel('y');

    grid on;
    legend();
    
    hold off;
end