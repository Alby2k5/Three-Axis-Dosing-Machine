# Testing and Validation

## Tests completed in the repository build

| Test | Result | Evidence |
|---|---|---|
| ZIP integrity | Both supplied software ZIP copies tested; their SHA-256 hashes are identical | private analysis report |
| Inventory | 723 files enumerated; sizes/extensions/hashes recorded | `metadata/inventory-summary.md` |
| TIA presence | 12 `.ap15`, six `.zap15`, no global `.alXX` library found | inventory |
| Duplicate analysis | 58 identical-content hash groups found across versions | private analysis output; public summary only |
| HMI metadata extraction | V15 target type/build timestamps recovered from `DownloadTask.xml` | source register |
| CSV examples | original formats compared and public fixtures produced | `examples/csv/` |
| Privacy build scan | public repository checked for forbidden private file types and selected patterns | publication guide / build log |
| Preview figures | equivalent formulas executed in the build environment | `matlab/figures/BUILD_NOTE.md` |

## Tests supplied but not executed here

- MATLAB contract tests `tests/test_csv_contract.m` and `tests/test_motion_models.m`, orchestrated by `tests/run_all_tests.m`;
- all MATLAB analysis scripts in the target MATLAB release.

The build environment had no MATLAB or GNU Octave executable. This limit is recorded rather than hidden.

## Tests not possible without TIA Portal V15

- opening/migrating every project without repair;
- compile status and diagnostics;
- hardware catalogue/configuration verification;
- exact PLC block and HMI tag comparison;
- script syntax validation in WinCC;
- online/offline comparison and downloaded-version identification;
- HSC, cycle/task and drive parameter review.

## Tests not possible without the machine

- continuity, insulation and supply measurements;
- sensor polarity and I/O truth table;
- drive direction/speed presets;
- homing repeatability and limit behavior;
- encoder scale and maximum pulse rate;
- stopping error, repeatability, settling and cycle time;
- Z/plunger quantity and process repeatability;
- E-stop, guard/optical-device and restart safety validation.

## Required acceptance records

A defensible validation package should include controlled software version/hash, hardware configuration export, I/O checklist, calibrated measurement method, repeated test data, anomalies/corrective actions, authorised safety report and final acceptance signature.
