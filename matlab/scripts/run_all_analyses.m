%RUN_ALL_ANALYSES Execute every offline analysis in a controlled order.
%
% Results are simulations/derivations. They do not validate the PLC or the
% physical machine.

thisFile = mfilename('fullpath');
matlabRoot = fileparts(fileparts(thisFile));
addpath(fullfile(matlabRoot, 'functions'));
addpath(fullfile(matlabRoot, 'scripts'));

fprintf('\nThree-axis dosing machine: offline MATLAB analysis\n');
fprintf('Repository MATLAB root: %s\n', matlabRoot);

analyze_source_points(matlabRoot);
estimate_cycle_time(matlabRoot);
analyze_motion_profile(matlabRoot);
compare_path_ordering(matlabRoot);
analyze_sampling_quantization(matlabRoot);
simulate_position_error(matlabRoot);

fprintf('\nAll requested analyses completed. Review assumptions in illustrative_config.m.\n');
