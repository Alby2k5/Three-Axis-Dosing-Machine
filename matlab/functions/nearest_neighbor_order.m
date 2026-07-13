function [orderedPoints, order] = nearest_neighbor_order(points, startIndex)
%NEAREST_NEIGHBOR_ORDER Greedy open-path ordering from a selected point.
%
% This heuristic is deterministic and does not guarantee a global optimum.
% It ignores process precedence, obstacles, Z actions and safety constraints.

    if nargin < 2
        startIndex = 1;
    end
    if ~isnumeric(points) || ~isreal(points) || ndims(points) ~= 2 || size(points, 2) ~= 2
        error('Dosing:PointShape', 'Points must be a real N-by-2 numeric matrix.');
    end
    if any(~isfinite(points(:)))
        error('Dosing:PointFinite', 'All point coordinates must be finite.');
    end

    n = size(points, 1);
    if n == 0
        orderedPoints = points;
        order = zeros(0, 1);
        return;
    end
    if startIndex < 1 || startIndex > n || startIndex ~= floor(startIndex)
        error('Dosing:StartIndex', 'startIndex must identify an existing point.');
    end

    visited = false(n, 1);
    order = zeros(n, 1);
    order(1) = startIndex;
    visited(startIndex) = true;

    for k = 2:n
        current = order(k - 1);
        delta = points - points(current, :);
        distanceSquared = sum(delta .^ 2, 2);
        distanceSquared(visited) = Inf;
        [~, next] = min(distanceSquared);
        order(k) = next;
        visited(next) = true;
    end

    orderedPoints = points(order, :);
end
