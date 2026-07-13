function result = analyze_source_points(matlabRoot)
%ANALYZE_SOURCE_POINTS Validate, plot and measure the source-derived path.

    addpath(fullfile(matlabRoot, 'functions'));
    inputFile = fullfile(matlabRoot, 'sample-data', 'source-derived-points.csv');
    [points, meta] = load_dosing_points(inputFile);
    report = validate_dosing_points(points, struct('maxPoints', 1000));
    assert(report.ok, strjoin(report.errors, ' | '));
    [totalDistance, segmentDistances] = path_length(points);

    fprintf('\nSource-derived points: %d\n', meta.pointCount);
    fprintf('Open-path distance: %.6g encoder-count units\n', totalDistance);

    fig = figure('Name', 'Source-derived dosing path');
    plot(points(:,1), points(:,2), '-o', 'LineWidth', 1.2, 'MarkerSize', 6);
    grid on;
    xlabel('X [encoder-count units]');
    ylabel('Y [encoder-count units]');
    title('Source-Derived Coordinate Sequence');
    legend('Point order', 'Location', 'best');
    for k = 1:size(points,1)
        text(points(k,1), points(k,2), sprintf('  %d', k));
    end
    export_figure(fig, fullfile(matlabRoot, 'figures', 'source_path.png'));
    close(fig);

    result = struct('points', points, 'segmentDistances', segmentDistances, ...
        'totalDistance', totalDistance, 'units', meta.units);
end
