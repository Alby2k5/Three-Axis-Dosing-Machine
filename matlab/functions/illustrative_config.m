function cfg = illustrative_config()
%ILLUSTRATIVE_CONFIG Numerical assumptions used only for demonstrations.
%
% None of these values were measured on the machine. Replace them with a
% controlled configuration and cite the source before reporting timing.

    cfg.isMeasured = false;
    cfg.units = 'encoder-count units';
    cfg.maxVelocity = 200;          % count units/s, illustrative only
    cfg.acceleration = 400;         % count units/s^2, illustrative only
    cfg.profileDistance = 500;      % count units, illustrative move
    cfg.integrationTimeStep = 0.001;% seconds
    cfg.dwellPerReachedPoint = 0.10;% seconds, illustrative only
    cfg.sampleIntervals = [0.01, 0.02, 0.05]; % seconds
    cfg.encoderQuanta = [0.5, 1.0, 2.0];      % count units
    cfg.selectedSampleInterval = 0.02;
    cfg.selectedQuantum = 1.0;
    cfg.note = ['SIMULATION ONLY: values are not machine specifications ', ...
        'and must not be quoted as measured performance.'];
end
