%RUN_ALL_TESTS Execute the toolbox-free public contract tests.
%
% Run from any working directory with:
%   run('tests/run_all_tests.m')

thisFile = mfilename('fullpath');
testRoot = fileparts(thisFile);
addpath(testRoot);

fprintf('Running public MATLAB contract tests...\n');
test_csv_contract();
test_motion_models();
fprintf('All public MATLAB contract tests completed.\n');
