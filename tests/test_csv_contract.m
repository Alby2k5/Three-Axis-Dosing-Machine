function test_csv_contract()
%TEST_CSV_CONTRACT Minimal toolbox-free tests for public MATLAB functions.

    thisFile = mfilename('fullpath');
    testRoot = fileparts(thisFile);
    repoRoot = fileparts(testRoot);
    addpath(fullfile(repoRoot, 'matlab', 'functions'));
    fixtureRoot = fullfile(testRoot, 'fixtures');

    [p2, m2] = load_dosing_points(fullfile(fixtureRoot, 'valid-two-field.csv'));
    assert(isequal(size(p2), [4, 2]));
    assert(m2.pointCount == 4);

    [p3, m3] = load_dosing_points(fullfile(fixtureRoot, 'valid-three-field.csv'));
    assert(isequal(size(p3), [2, 2]));
    assert(strcmp(m3.annotations{2}, 'sample-b'));

    assert_throws(@() load_dosing_points(fullfile(fixtureRoot, ...
        'invalid-field-count.csv')), 'Dosing:CSVFieldCount');
    assert_throws(@() load_dosing_points(fullfile(fixtureRoot, ...
        'invalid-nonnumeric.csv')), 'Dosing:CSVNumeric');

    report = validate_dosing_points(p2, struct('maxPoints', 3));
    assert(~report.ok);

    [distance, segments] = path_length([0 0; 3 4; 6 8]);
    assert(abs(distance - 10) < 1e-12);
    assert(all(abs(segments - [5; 5]) < 1e-12));

    [ordered, order] = nearest_neighbor_order([0 0; 10 0; 2 0], 1);
    assert(isequal(order(:).', [1 3 2]));
    assert(isequal(size(ordered), [3 2]));

    [t, type, peak] = segment_motion_time(25, 10, 5);
    assert(strcmp(type{1}, 'trapezoidal'));
    assert(t > 0 && peak == 10);

    fprintf('All CSV and analysis contract tests passed.\n');
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
