function result = compare_path_ordering(matlabRoot)
%COMPARE_PATH_ORDERING Compare original and greedy nearest-neighbour paths.
%
% The 2-D points are synthetic. The analysis demonstrates a method and is
% not evidence of an optimised sequence on the physical machine.

    addpath(fullfile(matlabRoot, 'functions'));
    [points, ~] = load_dosing_points(fullfile(matlabRoot, 'sample-data', ...
        'synthetic-2d-points.csv'));
    [originalDistance, ~] = path_length(points);
    [ordered, order] = nearest_neighbor_order(points, 1);
    [orderedDistance, ~] = path_length(ordered);
    reduction = originalDistance - orderedDistance;

    fprintf('\nSynthetic route comparison (simulation only)\n');
    fprintf('Original distance: %.6g count units\n', originalDistance);
    fprintf('Nearest-neighbour distance: %.6g count units\n', orderedDistance);
    fprintf('Difference: %.6g count units\n', reduction);

    fig = figure('Name', 'Original synthetic path');
    plot(points(:,1), points(:,2), '-o', 'LineWidth', 1.2, 'MarkerSize', 6);
    grid on; axis equal;
    xlabel('X [encoder-count units]'); ylabel('Y [encoder-count units]');
    title('Synthetic Point Set — Original Order');
    legend('Original order', 'Location', 'best');
    for k = 1:size(points,1), text(points(k,1),points(k,2),sprintf('  %d',k)); end
    export_figure(fig, fullfile(matlabRoot, 'figures', 'route_original.png'));
    close(fig);

    fig = figure('Name', 'Nearest-neighbour synthetic path');
    plot(ordered(:,1), ordered(:,2), '-o', 'LineWidth', 1.2, 'MarkerSize', 6);
    grid on; axis equal;
    xlabel('X [encoder-count units]'); ylabel('Y [encoder-count units]');
    title('Synthetic Point Set — Nearest-Neighbour Order');
    legend('Nearest-neighbour order', 'Location', 'best');
    for k = 1:size(ordered,1), text(ordered(k,1),ordered(k,2),sprintf('  %d',order(k))); end
    export_figure(fig, fullfile(matlabRoot, 'figures', 'route_nearest_neighbor.png'));
    close(fig);

    resultFile = fullfile(matlabRoot, 'results', 'route_comparison.csv');
    fid = fopen(resultFile, 'wt');
    if fid < 0, error('Dosing:FileWrite', 'Cannot write %s', resultFile); end
    cleaner = onCleanup(@() fclose(fid)); %#ok<NASGU>
    fprintf(fid, 'metric,value_count_units\n');
    fprintf(fid, 'original_distance,%.12g\n', originalDistance);
    fprintf(fid, 'nearest_neighbor_distance,%.12g\n', orderedDistance);
    fprintf(fid, 'distance_difference,%.12g\n', reduction);

    result = struct('originalDistance', originalDistance, ...
        'orderedDistance', orderedDistance, 'difference', reduction, ...
        'order', order);
end
