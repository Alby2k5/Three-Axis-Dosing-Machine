# MATLAB Analysis Package

## Purpose

This package provides offline, reproducible analyses of coordinate lists and idealised motion. It is independent of the PLC and does not modify the private TIA Portal project.

## Requirements

- MATLAB R2019b or later is recommended.
- No specialised toolbox is required.
- GNU Octave compatibility was considered, but the repository build environment did not include Octave and therefore did not execute the `.m` files.

## Run

From the repository root:

```matlab
cd matlab
run('scripts/run_all_analyses.m')
```

## Data and units

- `sample-data/source-derived-points.csv` contains four X/Y coordinate pairs copied from an archived example, with the timestamps removed. Units remain **encoder-count units**.
- `sample-data/synthetic-2d-points.csv` is a synthetic test pattern used only for path-order comparison.
- `functions/illustrative_config.m` contains explicit simulation-only values. They are not measured settings or machine specifications.

## Scripts

| Script | Purpose | Main outputs |
|---|---|---|
| `analyze_source_points.m` | validate and visualise source-derived points | path length and `source_path.png` |
| `estimate_cycle_time.m` | ideal triangular/trapezoidal segment timing | CSV result table |
| `analyze_motion_profile.m` | position, speed and acceleration for one ideal move | three PNG figures |
| `compare_path_ordering.m` | nearest-neighbour open-path comparison | two PNG figures and distance summary |
| `analyze_sampling_quantization.m` | sensitivity to sample time and count quantum | error plots and summary CSV |
| `simulate_position_error.m` | show ideal reference versus sampled/quantised observation | trajectory and error PNGs |

## Model limits

The analyses exclude drive parameter sets, discrete relay delays, motor torque, load, backlash, compliance, axis coupling, Z/dosing actions, process dwell, safety logic and measured settling. Cycle-time estimates are valid only for the assumptions supplied by the user.

## Figure provenance

Preview figures in `figures/` were generated during repository construction by a reference implementation of the same equations because no MATLAB/Octave executable was available. Regenerate them in MATLAB before publication and record the MATLAB release/test result.

## Contract tests

From the repository root:

```matlab
run('tests/run_all_tests.m')
```

The tests are toolbox-free, but they were not executed in the build environment because MATLAB/Octave was unavailable.
