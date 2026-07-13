function result = estimate_cycle_time(matlabRoot)
%ESTIMATE_CYCLE_TIME Estimate ideal XY travel time for source-derived points.
%
% Input assumptions come from illustrative_config.m and are not measured.
% Z motion, dosing, washing, drive dynamics and settling are excluded except
% for the explicitly configured illustrative per-point dwell.

    addpath(fullfile(matlabRoot, 'functions'));
    cfg = illustrative_config();
    [points, ~] = load_dosing_points(fullfile(matlabRoot, 'sample-data', ...
        'source-derived-points.csv'));
    [~, distances] = path_length(points);
    [times, types, peaks] = segment_motion_time(distances, ...
        cfg.maxVelocity, cfg.acceleration);
    dwellTotal = cfg.dwellPerReachedPoint * numel(distances);
    travelTotal = sum(times);
    estimatedTotal = travelTotal + dwellTotal;

    fprintf('\n%s\n', cfg.note);
    fprintf('Ideal XY travel time: %.6g s\n', travelTotal);
    fprintf('Illustrative dwell total: %.6g s\n', dwellTotal);
    fprintf('Illustrative combined estimate: %.6g s\n', estimatedTotal);

    resultFile = fullfile(matlabRoot, 'results', 'source_cycle_estimate.csv');
    fid = fopen(resultFile, 'wt');
    if fid < 0, error('Dosing:FileWrite', 'Cannot write %s', resultFile); end
    cleaner = onCleanup(@() fclose(fid)); %#ok<NASGU>
    fprintf(fid, 'segment,distance_count_units,profile,peak_velocity_count_units_per_s,time_s\n');
    for k = 1:numel(distances)
        fprintf(fid, '%d,%.12g,%s,%.12g,%.12g\n', ...
            k, distances(k), types{k}, peaks(k), times(k));
    end
    fprintf(fid, 'TOTAL_TRAVEL,,,,%.12g\n', travelTotal);
    fprintf(fid, 'TOTAL_WITH_ILLUSTRATIVE_DWELL,,,,%.12g\n', estimatedTotal);

    result = struct('travelTime', travelTotal, 'dwellTime', dwellTotal, ...
        'estimatedTime', estimatedTotal, 'configuration', cfg);
end
