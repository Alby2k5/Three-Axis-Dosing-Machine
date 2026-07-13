# PLC Program Reconstruction

## Available evidence

The private archive contains TIA Portal V15 project containers rather than a neutral XML source export of the PLC blocks. Search indexes expose names, comments and references such as counters, high-speed-counter channels, in-range/arrival terms, sequence index and Z authorisations. This supports a functional map but not exact rung reproduction.

## Reconstructed organisation

| Functional area | Recovered indications | Required TIA check |
|---|---|---|
| Mode and HMI interface | manual/semi-auto/automatic/stepper controls; SmartTags transfer | actual tag table and arbitration |
| Homing | X/Y zero sensors; source report says homing is the manual-mode automation | state sequence, timeouts and failure handling |
| Encoder acquisition | X/Y A/B inputs and `HSC_1`/`HSC_2` terms | counter mode, edge multiplier, reset/latch behavior |
| Target load | X/Y vector tags, point count and sequence index | DB types, array bounds and handshake |
| Direction | inversion/direction outputs for each axis | sign convention and interlocks |
| Speed selection | speed 1/speed 2 outputs and “gestione velocità” terms | threshold calculation and mutually exclusive outputs |
| Arrival | `inrange`, `arrivatopos`, target/current counters | tolerance, hysteresis and settling confirmation |
| Z/dosing | Z-up/down tags, authorisations and plunger controls | permissives, timeout and collision prevention |
| Alarms/stops | HMI error messages described for out-of-range coordinates | complete alarm list, latching and safe-state behavior |

## Reconstructed target logic

The documentary description supports this conceptual sequence:

1. Require selected mode, homing and all machine permissives.
2. Load X/Y target from manual entry, computed recipe or imported array.
3. Compare target and encoder count to determine each direction.
4. Command low speed at departure and inside a deceleration region; command higher speed in the intermediate region.
5. Remove movement commands inside an arrival window.
6. Advance sequence only when all required axes/actions report completion.

The archive does not expose the numerical thresholds, scan timing, timeout values or final output arbitration. See [plc/sanitized-extracts/motion-control-pseudocode.md](../plc/sanitized-extracts/motion-control-pseudocode.md).

## Stops and interlocks

A safe implementation should make stop/safety conditions dominant over HMI and sequence commands. That priority cannot be proven from the recovered text index. Before reuse, inspect:

- normally closed versus normally open sensor assumptions;
- output reset on mode change, fault and communication loss;
- simultaneous direction/speed command prevention;
- Z-up/Z-down mutual exclusion;
- stale HMI array/request handling;
- sequence index and array bounds;
- motion and action timeouts;
- restart behavior after power cycle or E-stop.
