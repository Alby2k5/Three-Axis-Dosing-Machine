# Figure Build Note

The PNG previews in this directory were generated during repository construction by a Python reference implementation of the same equations because MATLAB and GNU Octave were unavailable in the build environment.

They are included to make the documentation immediately readable, not as proof that the `.m` files executed. Before public release:

1. run `matlab/scripts/run_all_analyses.m` in the target MATLAB release;
2. run `tests/test_csv_contract.m`;
3. compare regenerated plots/results with the previews;
4. record the MATLAB release and test log in the repository.
