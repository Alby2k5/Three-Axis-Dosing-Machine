function [timeSeconds, profileType, peakVelocity] = segment_motion_time(distance, maxVelocity, acceleration)
%SEGMENT_MOTION_TIME Ideal symmetric triangular/trapezoidal move time.
%
% Inputs must use consistent units, for example count units, count units/s
% and count units/s^2. The model excludes jerk, drive latency and settling.

    if any(distance(:) < 0) || ~all(isfinite(distance(:)))
        error('Dosing:Distance', 'Distance must be finite and non-negative.');
    end
    if ~isscalar(maxVelocity) || maxVelocity <= 0 || ~isfinite(maxVelocity)
        error('Dosing:Velocity', 'maxVelocity must be a positive finite scalar.');
    end
    if ~isscalar(acceleration) || acceleration <= 0 || ~isfinite(acceleration)
        error('Dosing:Acceleration', 'acceleration must be a positive finite scalar.');
    end

    timeSeconds = zeros(size(distance));
    peakVelocity = zeros(size(distance));
    profileType = cell(size(distance));
    threshold = maxVelocity ^ 2 / acceleration;

    for k = 1:numel(distance)
        d = distance(k);
        if d == 0
            timeSeconds(k) = 0;
            peakVelocity(k) = 0;
            profileType{k} = 'stationary';
        elseif d >= threshold
            timeSeconds(k) = 2 * maxVelocity / acceleration + ...
                (d - threshold) / maxVelocity;
            peakVelocity(k) = maxVelocity;
            profileType{k} = 'trapezoidal';
        else
            timeSeconds(k) = 2 * sqrt(d / acceleration);
            peakVelocity(k) = sqrt(d * acceleration);
            profileType{k} = 'triangular';
        end
    end
end
