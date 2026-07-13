function result = sample_and_quantize(time, referencePosition, sampleInterval, quantum)
%SAMPLE_AND_QUANTIZE Apply ideal sampling, quantisation and zero-order hold.
%
% This is an observation model only. It does not model encoder pulse loss,
% HSC filtering, electrical noise or mechanical error.

    if ~isnumeric(time) || ~isreal(time) || ~isnumeric(referencePosition) || ...
            ~isreal(referencePosition)
        error('Dosing:VectorType', ...
            'time and referencePosition must be real numeric vectors.');
    end
    if ~isvector(time) || ~isvector(referencePosition) || ...
            numel(time) ~= numel(referencePosition) || isempty(time)
        error('Dosing:VectorLength', ...
            'time and referencePosition must be non-empty vectors of equal length.');
    end
    if any(~isfinite(time(:))) || any(~isfinite(referencePosition(:)))
        error('Dosing:VectorFinite', ...
            'time and referencePosition must contain only finite values.');
    end
    if numel(time) > 1 && any(diff(time(:)) <= 0)
        error('Dosing:TimeOrder', 'time must be strictly increasing.');
    end
    if ~isscalar(sampleInterval) || ~isfinite(sampleInterval) || sampleInterval <= 0 || ...
            ~isscalar(quantum) || ~isfinite(quantum) || quantum <= 0
        error('Dosing:SamplingParameters', ...
            'sampleInterval and quantum must be positive finite scalars.');
    end

    time = time(:);
    referencePosition = referencePosition(:);

    if numel(time) == 1
        quantized = round(referencePosition / quantum) * quantum;
        errorSignal = quantized - referencePosition;
        result = struct('sampleTimes', time, 'sampled', referencePosition, ...
            'quantized', quantized, 'held', quantized, ...
            'error', errorSignal, ...
            'maxAbsoluteError', abs(errorSignal), ...
            'meanAbsoluteError', abs(errorSignal));
        return;
    end

    sampleTimes = (time(1):sampleInterval:time(end)).';
    if sampleTimes(end) < time(end)
        sampleTimes(end + 1, 1) = time(end);
    end

    sampled = interp1(time, referencePosition, sampleTimes, 'linear');
    quantized = round(sampled / quantum) * quantum;

    held = zeros(size(time));
    j = 1;
    for k = 1:numel(time)
        while j < numel(sampleTimes) && sampleTimes(j + 1) <= time(k)
            j = j + 1;
        end
        held(k) = quantized(j);
    end

    errorSignal = held - referencePosition;
    result = struct();
    result.sampleTimes = sampleTimes;
    result.sampled = sampled;
    result.quantized = quantized;
    result.held = held;
    result.error = errorSignal;
    result.maxAbsoluteError = max(abs(errorSignal));
    result.meanAbsoluteError = mean(abs(errorSignal));
end
