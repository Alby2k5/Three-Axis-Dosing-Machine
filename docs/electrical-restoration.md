# Electrical Restoration and Recovery

## What is evidenced

The archive contains interface design sheets, I/O tables, a manufacturer wiring package, historical progress notes and later cabinet photographs. It does **not** contain a signed restoration log, continuity measurements, insulation results, replacement-part records or a dated I/O commissioning sheet.

Therefore the repository cannot state that the following actions were personally or successfully completed:

- rewiring or replacement of specific conductors;
- repair of power supplies, drives, motors or sensors;
- verified continuity of every channel;
- live I/O forcing and actuator confirmation;
- safety-device validation;
- final functional acceptance.

## Evidence-based inspection checklist

This is a review checklist, not a substitute for local procedures or qualified personnel.

| Stage | Check | Required record |
|---|---|---|
| Documentation | Reconcile manufacturer drawings, interface workbook and actual labels | redlined schematic / discrepancy log |
| De-energised | Visual condition, protective earth, terminals, flat-cable orientation, connector retention | inspection sheet and photographs |
| De-energised | Point-to-point continuity and isolation between 5 V and 24 V domains | measured channel table |
| Power | Verify supply rails and polarity before connecting field loads | voltage/current log |
| PLC inputs | Exercise each sensor and compare physical state, LED, watch table and HMI | I/O acceptance table |
| PLC outputs | Test one channel at a time with actuators isolated or controlled | authorised test record |
| Motion | Confirm direction at reduced speed, zero sensors and stopping behavior | risk-controlled motion log |
| Safety | Validate emergency stop, guards/optical devices and restart inhibition | machine-specific safety report |

## Historical bypass note

One private worksheet contains a suggestion to bypass a water-presence signal when water is disconnected. This is preserved only as historical evidence. It is **not** reproduced as an instruction and must not be implemented without a formal functional analysis, risk assessment and authorised design change.

## Software recovery

The original TIA files were preserved unchanged. Hashes and an inventory were generated, but no PLC/HMI compile or online comparison was possible in the analysis environment. See [testing.md](testing.md).
