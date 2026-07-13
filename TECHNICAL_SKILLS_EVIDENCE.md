# Technical Skills Evidence

| Competence | Activity performed | File or section that demonstrates it | Evidence status |
|---|---|---|---|
| Industrial automation | Reconstructed sensors, actuators, drives, interface boards and operating modes. | `docs/hardware-architecture.md`, `docs/system-architecture.md` | Observed + documented |
| PLC programming | Mapped functional blocks, sequence states, permissives, homing and arrival logic from TIA search data and reports. | `docs/plc-program.md`, `plc/block-map.md`, `plc/sequence-description.md` | Recovered; exact networks unverified |
| Ladder Logic | Produced non-deployable network-level pseudocode tied to recovered symbols/comments. | `plc/sanitized-extracts/motion-control-pseudocode.md` | Reconstructed |
| Siemens TIA Portal V15 | Identified 12 V15 project descriptors, six archives and HMI target metadata; documented validation steps. | `metadata/inventory-summary.md`, `docs/testing.md` | Documented; no compile available |
| HMI / WinCC | Reconstructed four operating areas, KTP700 Basic and PC Runtime roles. | `docs/hmi-and-vbscript.md`, `hmi/screen-map.md` | Documented + recovered |
| VBScript | Analysed file-system, split/read/write and SmartTags patterns; created sanitised examples. | `hmi/sanitized-scripts/` | Recovered + newly authored examples |
| CSV handling | Defined schema, validation rules, malformed-row behavior and test fixtures. | `docs/csv-import.md`, `examples/csv/`, `tests/test_csv_contract.m` | Implemented in public analysis |
| Cartesian motion | Analysed direction, two-speed approach, arrival band, inertia and homing. | `docs/motion-analysis.md`, `plc/sequence-description.md` | Documented + analytical |
| Encoder systems | Traced A/B channels and high-speed-counter references; documented missing resolution/calibration. | `docs/encoder-and-sampling.md`, `plc/io-map.md` | Documented; parameters unverified |
| MATLAB | Implemented parsing, validation, path distance, profiles, timing and error sensitivity. | `matlab/scripts/`, `matlab/functions/` | Newly authored simulation code |
| Trajectory optimisation | Implemented and bounded a nearest-neighbour open-path comparison. | `matlab/scripts/compare_path_ordering.m`, `docs/trajectory-optimization.md` | Simulated; not deployed |
| Verification | Built requirement/source/method/status matrix and physical/TIA test plan. | `docs/verification-matrix.md`, `docs/testing.md` | Documented |
| Technical writing | Separated facts, recovered logic, simulations, proposals and unknowns. | `README.md`, `docs/`, `PROJECT_SCOPE.md` | Public deliverable |
| Git / GitHub | Structured publication-ready repository, licence, ignore rules and checklist. | `.gitignore`, `CHANGELOG.md`, `PUBLICATION_CHECKLIST.md` | Public deliverable |
