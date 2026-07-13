# Functional Block Map

The block names below are descriptive public aliases. They are not claimed to match the private TIA block names.

| Public alias | Responsibility | Recovered evidence | Confidence |
|---|---|---|---|
| `ModeManager` | manual/semi-auto/automatic/stepper selection and command arbitration | four HMI areas in report | medium |
| `PermissiveManager` | process/sensor readiness and stop dominance | I/O list; HMI alarm concepts | low until TIA review |
| `HomingXY` | reference X/Y using zero sensors and counter reset | zero inputs; report says homing automation | medium |
| `EncoderAcquisition` | read X/Y high-speed counters | A/B channels; `HSC_1`/`HSC_2` search terms | high functional, low configuration detail |
| `TargetLoader` | choose manual/computed/CSV target and index | SmartTags, vectors/count, sequence terms | medium |
| `AxisXControl` | direction, speed 1/2 and in-range stop | X outputs, counters, in-range terms | medium-high |
| `AxisYControl` | direction, speed 1/2 and in-range stop | Y outputs, counters, in-range terms | medium-high |
| `ArrivalCoordinator` | combine X/Y arrived flags and settle conditions | `arrivatopos`, `memoarrivo` terms | medium |
| `ZSequence` | up/down actuation and end-position checks | Z I/O and authorisation terms | medium |
| `PlungerControl` | step/enable/direction and manual speeds | I/O map and report | medium |
| `SequenceManager` | advance point/action index and completion | sequence/index terms and report | medium |
| `AlarmManager` | invalid coordinates, timeout and state messages | report describes range error; full list absent | low-medium |

## Exact items to extract in TIA

- organisation block call tree;
- actual FB/FC/DB names and interfaces;
- network comments and Ladder logic;
- HSC technology object configuration;
- output arbitration order;
- tolerance/deceleration constants;
- array bounds and index type;
- retain/startup behavior and fault reset.
