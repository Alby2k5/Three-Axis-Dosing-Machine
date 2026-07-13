function profile = analyze_motion_profile(matlabRoot)
%ANALYZE_MOTION_PROFILE Plot ideal position, velocity and acceleration.

    addpath(fullfile(matlabRoot, 'functions'));
    cfg = illustrative_config();
    profile = build_motion_profile(cfg.profileDistance, cfg.maxVelocity, ...
        cfg.acceleration, cfg.integrationTimeStep);

    fprintf('\nMotion profile: %s, duration %.6g s, peak %.6g count units/s\n', ...
        profile.profileType, profile.totalTime, profile.peakVelocity);
    fprintf('%s\n', cfg.note);

    fig = figure('Name', 'Ideal position profile');
    plot(profile.time, profile.position, 'LineWidth', 1.2);
    grid on; xlabel('Time [s]'); ylabel('Position [encoder-count units]');
    title('Ideal Symmetric Motion — Position');
    legend('Position', 'Location', 'best');
    export_figure(fig, fullfile(matlabRoot, 'figures', 'motion_position.png'));
    close(fig);

    fig = figure('Name', 'Ideal velocity profile');
    plot(profile.time, profile.velocity, 'LineWidth', 1.2);
    grid on; xlabel('Time [s]'); ylabel('Velocity [count units/s]');
    title('Ideal Symmetric Motion — Velocity');
    legend('Velocity', 'Location', 'best');
    export_figure(fig, fullfile(matlabRoot, 'figures', 'motion_velocity.png'));
    close(fig);

    fig = figure('Name', 'Ideal acceleration profile');
    plot(profile.time, profile.acceleration, 'LineWidth', 1.2);
    grid on; xlabel('Time [s]'); ylabel('Acceleration [count units/s^2]');
    title('Ideal Symmetric Motion — Acceleration');
    legend('Acceleration', 'Location', 'best');
    export_figure(fig, fullfile(matlabRoot, 'figures', 'motion_acceleration.png'));
    close(fig);
end
