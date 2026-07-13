# Requirement and Verification Matrix

| Requirement | Identified implementation | Source | Verification method | Status |
|---|---|---|---|---|
| Three Cartesian axes | X/Y portal travel and vertical Z head | photos + report | physical inspection and controlled jog | Partially observed |
| PLC control | S7-1200 project and cabinet CPU | TIA descriptors + photo | open hardware config; online identify | Conflict/unverified |
| Ladder program | counters, in-range, sequence and speed terms | TIA search indexes | export/inspect blocks and compile | Recovered only |
| HMI manual mode | manual axis controls | report/HMI artifacts | runtime screen test | Documented |
| HMI semi-auto | coordinate entry, range check and start | report | invalid/valid target tests | Documented |
| HMI automatic | source/destination sequence | report + sequence snapshot | trace state/index and outputs | Partially recovered |
| Stepper control | enable, direction, speed | report + I/O map | output/pulse-frequency test | Documented |
| CSV import | file read, split, arrays/count transfer | recovered VBScript | fixture tests + tag trace | Recovered; public example implemented |
| CSV validation | strict schema/type/count handling | public clean-room script | valid/invalid fixtures | Proposed/public example; original weak |
| Homing | X/Y zero sensors; report mention | I/O map + report | start away from home; timeout/fault tests | Documented, unverified |
| X/Y feedback | A/B channels and HSC references | I/O map + TIA index | HSC configuration and count-direction tests | Documented, unverified |
| Two-speed motion | two speed outputs per axis | I/O map + report | watch outputs versus error and speed | Documented, unverified |
| Braking/arrival | in-range/arrival terms | TIA index + report | repeated stop-error study | Recovered; no measurements |
| Z limits | up/down position inputs and outputs | I/O map | interlock/timeout test | Documented, unverified |
| Process permissives | liquid, cup, air and other signals | I/O map | truth table and fault injection | Documented, unverified |
| MATLAB path analysis | distance and plots | public scripts | run tests and compare hand calculation | Implemented; MATLAB run pending |
| MATLAB timing | triangular/trapezoidal model | public functions | unit tests and parameter review | Implemented simulation |
| Route comparison | nearest-neighbour heuristic | public script | compare distance before/after | Implemented simulation |
| Safety | optical devices/protection visible | photos | authorised safety validation | Not verified |
| Public confidentiality | originals excluded and files scanned | manifest/.gitignore | review ZIP and secret scan | Implemented; manual review required |
