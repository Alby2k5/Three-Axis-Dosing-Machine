# PLC Sequence Description

## Command sources

1. manual HMI controls;
2. semi-automatic X/Y target entry;
3. computed automatic source/destination coordinates;
4. imported CSV X/Y vector;
5. manual stepper-plunger controls.

Only one command source should own each output at a time. The original arbitration must be checked.

## Conceptual point-list cycle

| State | Entry condition | Main action | Exit condition |
|---|---|---|---|
| Idle | reset / no active command | outputs safe; show status | valid load or manual mode |
| Load | file request | validate and transfer complete vectors/count | accepted or rejected |
| Home | reference needed | move axes to zero sensors and reset counts | both referenced or timeout |
| Prepare | valid index and permissives | copy current X/Y targets | targets latched |
| Move XY | start authorised | direction and speed selection | both axes arrived or fault |
| Z action | XY arrived | lower/raise head and operate plunger as required | end positions/action complete |
| Advance | action complete | increment index | next point or complete |
| Complete | final index complete | clear run and notify HMI | operator reset |
| Fault | stop, timeout, invalid state | remove movement commands and latch cause | authorised reset after cause removed |

## Required invariants

- Z up and down outputs never active together.
- X/Y speed selections are mutually consistent with direction/run logic.
- Sequence index is always within accepted point count and physical array bounds.
- A new file cannot replace active vectors mid-cycle.
- Lost permissive or stop has higher priority than HMI/sequence motion.
- Homing and target positions use a documented counter reference convention.
- Fault reset does not automatically resume an unsafe partial action.
