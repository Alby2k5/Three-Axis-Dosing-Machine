function tableData = analyze_sampling_quantization(matlabRoot)
%ANALYZE_SAMPLING_QUANTIZATION Sensitivity of observation error.
%
% This analysis uses an ideal motion reference and does not model missed
% pulses, electrical noise, HSC filters or mechanical behavior.

    addpath(fullfile(matlabRoot, 'functions'));
    cfg = illustrative_config();
    profile = build_motion_profile(cfg.profileDistance, cfg.maxVelocity, ...
        cfg.acceleration, cfg.integrationTimeStep);

    intervals = cfg.sampleIntervals;
    quanta = cfg.encoderQuanta;
    maxError = zeros(numel(quanta), numel(intervals));
    meanError = zeros(numel(quanta), numel(intervals));

    for q = 1:numel(quanta)
        for s = 1:numel(intervals)
            r = sample_and_quantize(profile.time, profile.position, ...
                intervals(s), quanta(q));
            maxError(q,s) = r.maxAbsoluteError;
            meanError(q,s) = r.meanAbsoluteError;
        end
    end

    fig = figure('Name', 'Sampling and quantisation sensitivity');
    hold on;
    for q = 1:numel(quanta)
        plot(intervals, maxError(q,:), '-o', 'LineWidth', 1.2, ...
            'DisplayName', sprintf('Quantum %.3g count units', quanta(q)));
    end
    hold off; grid on;
    xlabel('Sample interval [s]');
    ylabel('Maximum absolute observation error [count units]');
    title('Ideal Sample-and-Hold / Quantisation Sensitivity');
    legend('Location', 'best');
    export_figure(fig, fullfile(matlabRoot, 'figures', 'sampling_sensitivity.png'));
    close(fig);

    resultFile = fullfile(matlabRoot, 'results', 'sampling_quantization.csv');
    fid = fopen(resultFile, 'wt');
    if fid < 0, error('Dosing:FileWrite', 'Cannot write %s', resultFile); end
    cleaner = onCleanup(@() fclose(fid)); %#ok<NASGU>
    fprintf(fid, 'sample_interval_s,quantum_count_units,max_abs_error_count_units,mean_abs_error_count_units\n');
    for q = 1:numel(quanta)
        for s = 1:numel(intervals)
            fprintf(fid, '%.12g,%.12g,%.12g,%.12g\n', intervals(s), quanta(q), ...
                maxError(q,s), meanError(q,s));
        end
    end

    tableData = struct('sampleIntervals', intervals, 'quanta', quanta, ...
        'maxAbsoluteError', maxError, 'meanAbsoluteError', meanError, ...
        'configuration', cfg);
end
