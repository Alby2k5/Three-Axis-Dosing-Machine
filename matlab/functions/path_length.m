function [totalDistance, segmentDistances] = path_length(points)
%PATH_LENGTH Compute Euclidean length of an open X/Y point sequence.
%
% Units are inherited from points. No return-to-origin segment is added.

    if ~isnumeric(points) || ~isreal(points) || ndims(points) ~= 2 || size(points, 2) ~= 2
        error('Dosing:PointShape', 'Points must be a real N-by-2 numeric matrix.');
    end
    if any(~isfinite(points(:)))
        error('Dosing:PointFinite', 'All point coordinates must be finite.');
    end
    if size(points, 1) < 2
        segmentDistances = zeros(0, 1);
        totalDistance = 0;
        return;
    end

    delta = diff(points, 1, 1);
    segmentDistances = sqrt(sum(delta .^ 2, 2));
    totalDistance = sum(segmentDistances);
end
