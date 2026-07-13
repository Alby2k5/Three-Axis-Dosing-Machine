# MATLAB Analysis

## Separation from the control system

The MATLAB package is an offline analysis layer added after the archived control work. It does not communicate with the PLC, change the TIA project or prove physical performance.

## Analyses

| Script | Output | Main limitation |
|---|---|---|
| `analyze_source_points.m` | source-derived path plot and distance in count units | source sample is one-dimensional in Y |
| `estimate_cycle_time.m` | ideal segment and total time estimate | depends entirely on user-supplied kinematic assumptions |
| `analyze_motion_profile.m` | separate position, velocity and acceleration plots | ideal symmetric acceleration, no jerk/drive dynamics |
| `compare_path_ordering.m` | original versus nearest-neighbour open path | synthetic 2-D sample; no process constraints |
| `analyze_sampling_quantization.m` | error sensitivity versus sample interval/quantum | observation model only |
| `simulate_position_error.m` | sample-and-hold/quantisation error trace | excludes mechanical and control error |

## Input data

- `source-derived-points.csv` preserves four archived coordinate pairs and labels units as counts.
- `synthetic-2d-points.csv` is generated only to make route-order comparison meaningful. It is not a machine program or measurement.

## Assumptions

The default configuration is deliberately named `illustrative_config`. Values are plausible numerical examples in count units and must not be quoted as machine settings. Each result file/figure includes this disclaimer.

## Reproducibility

The repository build environment did not include MATLAB or GNU Octave. Preview PNGs were generated with an equivalent reference implementation of the documented formulas. Before publication, execute the MATLAB test suite in the target release and regenerate all figures; see `matlab/figures/BUILD_NOTE.md`.
