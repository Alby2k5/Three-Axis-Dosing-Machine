# Future Improvements

## Verification first

- select and compile a controlled TIA V15 baseline;
- reconcile actual CPU/modules and I/O addresses;
- create an online/offline comparison record;
- establish encoder scale, travel limits and speed presets;
- perform authorised I/O, homing, stop and safety acceptance tests.

## Control software

- explicit state machine with transition reasons and timeouts;
- output arbitration so stop/fault dominates every mode;
- robust HMI-to-PLC data handshake with checksum/version/count;
- bounded arrays and deterministic invalid-file behavior;
- separate calibrated axis parameters from sequence code;
- event log for load, homing, motion, timeout and operator reset;
- settling criterion with hysteresis or dwell, validated experimentally.

## CSV and data management

- versioned schema and unit declaration;
- machine/calibration identifier;
- optional header and checksum;
- independent offline validator;
- removal of local paths through configuration and controlled import folder.

## Motion and analysis

- identify drive ramps and discrete speed thresholds;
- measure stopping distributions by speed/load/direction;
- fit a model only after collecting data;
- optimise routes with process precedence, Z/dwell and washing constraints;
- compare distance objective with estimated cycle-time objective.

## Documentation

- export sanitised PLC block interfaces from TIA;
- add dated test logs and traceable photos;
- maintain a contributor-approved authorship record;
- tag public releases against private source hashes without publishing the sources.

All items in this page are proposed and not represented as installed.
