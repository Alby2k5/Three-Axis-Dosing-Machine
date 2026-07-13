function profile = build_motion_profile(distance, maxVelocity, acceleration, timeStep)
%BUILD_MOTION_PROFILE Generate an ideal 1-D symmetric motion profile.
%
% The output structure contains time, position, velocity, acceleration,
% profileType and peakVelocity. Position begins at zero and ends at distance.

    if ~isscalar(distance) || distance < 0 || ~isfinite(distance)
        error('Dosing:Distance', 'distance must be a finite non-negative scalar.');
    end
    if ~isscalar(timeStep) || timeStep <= 0 || ~isfinite(timeStep)
        error('Dosing:TimeStep', 'timeStep must be positive and finite.');
    end

    [totalTime, typeCell, peakVelocity] = segment_motion_time(distance, maxVelocity, acceleration);
    profileType = typeCell{1};

    if distance == 0
        profile = struct('time', 0, 'position', 0, 'velocity', 0, ...
            'acceleration', 0, 'profileType', profileType, ...
            'peakVelocity', 0, 'totalTime', 0);
        return;
    end

    if strcmp(profileType, 'trapezoidal')
        tAcc = maxVelocity / acceleration;
        vPeak = maxVelocity;
        dAcc = 0.5 * acceleration * tAcc ^ 2;
        tCruise = (distance - 2 * dAcc) / vPeak;
    else
        tAcc = sqrt(distance / acceleration);
        vPeak = acceleration * tAcc;
        dAcc = 0.5 * acceleration * tAcc ^ 2;
        tCruise = 0;
    end
    tDecStart = tAcc + tCruise;

    time = (0:timeStep:totalTime).';
    if time(end) < totalTime
        time(end + 1, 1) = totalTime;
    end
    position = zeros(size(time));
    velocity = zeros(size(time));
    accelVector = zeros(size(time));

    for k = 1:numel(time)
        t = time(k);
        if t <= tAcc
            accelVector(k) = acceleration;
            velocity(k) = acceleration * t;
            position(k) = 0.5 * acceleration * t ^ 2;
        elseif t <= tDecStart
            accelVector(k) = 0;
            velocity(k) = vPeak;
            position(k) = dAcc + vPeak * (t - tAcc);
        else
            tau = t - tDecStart;
            accelVector(k) = -acceleration;
            velocity(k) = max(0, vPeak - acceleration * tau);
            position(k) = distance - 0.5 * acceleration * (totalTime - t) ^ 2;
        end
    end

    position(end) = distance;
    velocity(end) = 0;
    accelVector(end) = 0;

    profile = struct('time', time, 'position', position, ...
        'velocity', velocity, 'acceleration', accelVector, ...
        'profileType', profileType, 'peakVelocity', peakVelocity, ...
        'totalTime', totalTime);
end
