function report = validate_dosing_points(points, options)
%VALIDATE_DOSING_POINTS Validate dimensions, count and optional bounds.
%
% options fields (all optional):
%   maxPoints      default 1000
%   xBounds        default [-Inf Inf]
%   yBounds        default [-Inf Inf]
%   requireInteger default false
%
% Physical bounds are deliberately not embedded in this repository because
% verified axis travel limits are unavailable.

    if nargin < 2
        options = struct();
    end
    if ~isfield(options, 'maxPoints'), options.maxPoints = 1000; end
    if ~isfield(options, 'xBounds'), options.xBounds = [-Inf, Inf]; end
    if ~isfield(options, 'yBounds'), options.yBounds = [-Inf, Inf]; end
    if ~isfield(options, 'requireInteger'), options.requireInteger = false; end

    errors = {};
    warnings = {};

    if ~isnumeric(points) || ndims(points) ~= 2 || size(points, 2) ~= 2
        errors{end + 1} = 'Points must be an N-by-2 numeric matrix.'; %#ok<AGROW>
    else
        if isempty(points)
            errors{end + 1} = 'At least one point is required.'; %#ok<AGROW>
        end
        if size(points, 1) > options.maxPoints
            errors{end + 1} = sprintf('Point count %d exceeds limit %d.', ...
                size(points, 1), options.maxPoints); %#ok<AGROW>
        end
        if any(~isfinite(points(:)))
            errors{end + 1} = 'All point coordinates must be finite.'; %#ok<AGROW>
        end
        if any(points(:, 1) < options.xBounds(1) | points(:, 1) > options.xBounds(2))
            errors{end + 1} = 'One or more X values are outside configured bounds.'; %#ok<AGROW>
        end
        if any(points(:, 2) < options.yBounds(1) | points(:, 2) > options.yBounds(2))
            errors{end + 1} = 'One or more Y values are outside configured bounds.'; %#ok<AGROW>
        end
        if options.requireInteger && any(abs(points(:) - round(points(:))) > eps(max(1, abs(points(:)))))
            errors{end + 1} = 'Integer coordinates are required by this configuration.'; %#ok<AGROW>
        end
        if size(unique(points, 'rows'), 1) < size(points, 1)
            warnings{end + 1} = 'The point list contains repeated coordinates.'; %#ok<AGROW>
        end
    end

    report = struct();
    report.ok = isempty(errors);
    report.errors = errors;
    report.warnings = warnings;
    if isnumeric(points) && ndims(points) == 2
        report.pointCount = size(points, 1);
    else
        report.pointCount = 0;
    end
end
