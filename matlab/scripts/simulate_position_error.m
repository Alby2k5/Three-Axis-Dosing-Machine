function result = simulate_position_error(matlabRoot)
%SIMULATE_POSITION_ERROR Compare ideal position with sampled/quantised value.
%
% The error is observational only. Inertia, backlash, drive dynamics and
% control delay are intentionally excluded because no measured model exists.

    addpath(fullfile(matlabRoot, 'functions'));
    cfg = illustrative_config();
    profile = build_motion_profile(cfg.profileDistance, cfg.maxVelocity, ...
        cfg.acceleration, cfg.integrationTimeStep);
    result = sample_and_quantize(profile.time, profile.position, ...
        cfg.selectedSampleInterval, cfg.selectedQuantum);

    fig = figure('Name', 'Position observation simulation');
    plot(profile.time, profile.position, 'LineWidth', 1.2, ...
        'DisplayName', 'Ideal reference');
    hold on;
    plot(profile.time, result.held, 'LineWidth', 1.0, ...
        'DisplayName', 'Sampled and quantised observation');
    hold off; grid on;
    xlabel('Time [s]'); ylabel('Position [encoder-count units]');
    title('Simulated Position Observation');
    legend('Location', 'best');
    export_figure(fig, fullfile(matlabRoot, 'figures', 'position_observation.png'));
    close(fig);

    fig = figure('Name', 'Position observation error');
    plot(profile.time, result.error, 'LineWidth', 1.0);
    grid on;
    xlabel('Time [s]'); ylabel('Observed - reference [count units]');
    title('Sample-and-Hold / Quantisation Error');
    legend('Observation error', 'Location', 'best');
    export_figure(fig, fullfile(matlabRoot, 'figures', 'position_observation_error.png'));
    close(fig);

    fprintf('\nPosition observation simulation: max |error| %.6g, mean |error| %.6g count units\n', ...
        result.maxAbsoluteError, result.meanAbsoluteError);
    fprintf('%s\n', cfg.note);
end
