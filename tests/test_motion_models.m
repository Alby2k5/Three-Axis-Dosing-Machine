function test_motion_models()
%TEST_MOTION_MODELS Toolbox-free checks for kinematic helper functions.

    thisFile = mfilename('fullpath');
    testRoot = fileparts(thisFile);
    repoRoot = fileparts(testRoot);
    addpath(fullfile(repoRoot, 'matlab', 'functions'));

    [t0, type0, peak0] = segment_motion_time(0, 10, 5);
    assert(t0 == 0 && strcmp(type0{1}, 'stationary') && peak0 == 0);

    [tTri, typeTri, peakTri] = segment_motion_time(5, 10, 5);
    assert(strcmp(typeTri{1}, 'triangular'));
    assert(abs(tTri - 2) < 1e-12);
    assert(abs(peakTri - 5) < 1e-12);

    [tTrap, typeTrap, peakTrap] = segment_motion_time(25, 10, 5);
    assert(strcmp(typeTrap{1}, 'trapezoidal'));
    assert(abs(tTrap - 4.5) < 1e-12);
    assert(peakTrap == 10);

    profile = build_motion_profile(25, 10, 5, 0.01);
    assert(abs(profile.position(1)) < 1e-12);
    assert(abs(profile.position(end) - 25) < 1e-12);
    assert(abs(profile.velocity(end)) < 1e-12);
    assert(all(diff(profile.position) >= -1e-10));
    assert(abs(profile.totalTime - tTrap) < 1e-12);

    stationary = build_motion_profile(0, 10, 5, 0.01);
    assert(stationary.totalTime == 0 && stationary.position == 0);

    observed = sample_and_quantize([0; 0.5; 1.0], [0; 1; 2], 0.5, 1.0);
    assert(isequal(observed.quantized, [0; 1; 2]));
    assert(observed.maxAbsoluteError == 0);

    single = sample_and_quantize(0, 0.4, 0.1, 1.0);
    assert(single.held == 0 && abs(single.error + 0.4) < 1e-12);

    duplicateReport = validate_dosing_points([0 0; 0 0]);
    assert(duplicateReport.ok && ~isempty(duplicateReport.warnings));

    boundedReport = validate_dosing_points([0 0; 11 2], ...
        struct('xBounds', [0 10], 'yBounds', [0 10]));
    assert(~boundedReport.ok);

    assert_throws(@() path_length([0 0; NaN 1]), 'Dosing:PointFinite');
    assert_throws(@() nearest_neighbor_order([0 0; Inf 1], 1), ...
        'Dosing:PointFinite');
    assert_throws(@() sample_and_quantize([0; 0], [0; 1], 0.1, 1), ...
        'Dosing:TimeOrder');

    fprintf('All motion-model contract tests passed.\n');
end

function assert_throws(action, expectedIdentifier)
    didThrow = false;
    try
        action();
    catch err
        didThrow = true;
        assert(strcmp(err.identifier, expectedIdentifier), ...
            'Expected %s but received %s.', expectedIdentifier, err.identifier);
    end
    assert(didThrow, 'Expected error %s was not raised.', expectedIdentifier);
end
