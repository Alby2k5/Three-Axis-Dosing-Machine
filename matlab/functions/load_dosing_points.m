function [points, meta] = load_dosing_points(filename)
%LOAD_DOSING_POINTS Read a semicolon-delimited X;Y[;annotation] file.
%
% Purpose:
%   Parse legacy-compatible dosing point files without assuming physical
%   units. The first two fields must be finite numeric values. A third field
%   is retained as an annotation (for example, a timestamp).
%
% Input:
%   filename - path to a text file.
%
% Output:
%   points   - N-by-2 matrix [X Y].
%   meta     - structure with source lines and optional annotations.
%
% Limits:
%   This parser does not apply machine travel limits or convert counts to mm.

    if nargin ~= 1
        error('Dosing:ArgumentCount', 'Expected one filename argument.');
    end

    fid = fopen(filename, 'rt');
    if fid < 0
        error('Dosing:FileOpen', 'Cannot open file: %s', filename);
    end
    cleaner = onCleanup(@() fclose(fid)); %#ok<NASGU>

    points = zeros(0, 2);
    annotations = cell(0, 1);
    sourceLines = zeros(0, 1);
    lineNumber = 0;

    while true
        raw = fgetl(fid);
        if ~ischar(raw)
            break;
        end
        lineNumber = lineNumber + 1;
        line = strtrim(raw);

        if isempty(line) || strncmp(line, '#', 1)
            continue;
        end

        fields = strsplit(line, ';');
        fields = cellfun(@strtrim, fields, 'UniformOutput', false);
        if numel(fields) ~= 2 && numel(fields) ~= 3
            error('Dosing:CSVFieldCount', ...
                'Line %d has %d fields; expected 2 or 3.', ...
                lineNumber, numel(fields));
        end

        x = str2double(fields{1});
        y = str2double(fields{2});
        if ~isfinite(x) || ~isfinite(y)
            error('Dosing:CSVNumeric', ...
                'Line %d contains a non-finite X or Y value.', lineNumber);
        end

        points(end + 1, :) = [x, y]; %#ok<AGROW>
        sourceLines(end + 1, 1) = lineNumber; %#ok<AGROW>
        if numel(fields) == 3
            annotations{end + 1, 1} = fields{3}; %#ok<AGROW>
        else
            annotations{end + 1, 1} = ''; %#ok<AGROW>
        end
    end

    if isempty(points)
        error('Dosing:CSVEmpty', 'No dosing points were found in %s.', filename);
    end

    meta = struct();
    meta.filename = filename;
    meta.sourceLines = sourceLines;
    meta.annotations = annotations;
    meta.pointCount = size(points, 1);
    meta.units = 'encoder-count units unless separately calibrated';
end
