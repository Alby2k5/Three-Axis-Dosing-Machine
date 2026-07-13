# PLC I/O Map

## Digital outputs — compact I/O PDF baseline

| Address | Function | Confidence / note |
|---|---|---|
| Q0.0 | Z-axis raising | compact PDF + workbook |
| Q0.1 | Z-axis lowering | compact PDF + workbook |
| Q0.2 | X-axis speed 1 | compact PDF + workbook |
| Q0.3 | X-axis speed 2 | compact PDF + workbook |
| Q0.4 | X-axis direction/inversion | compact PDF + workbook |
| Q0.5 | Y-axis speed 1 | compact PDF + workbook |
| Q0.6 | Y-axis speed 2 | compact PDF + workbook |
| Q0.7 | Y-axis direction/inversion | compact PDF + workbook |
| Q8.0 | solution stirring channel 1 | compact PDF |
| Q8.1 | solution stirring channel 2 | compact PDF |
| Q8.2 | washing drain | compact PDF |
| Q8.3 | washing water | compact PDF |
| Q8.4 | cup suction | compact PDF |
| Q8.5 | suction-cup turning | compact PDF |
| Q8.6 | solution water | compact PDF |
| Q9.0 | stepper step | compact PDF; workbook variant differs |
| Q9.1 | stepper enable | compact PDF; workbook variant differs |
| Q9.2 | stepper direction | compact PDF; workbook variant differs |

## Digital/high-speed inputs

| Address | Function | Confidence / note |
|---|---|---|
| I0.0 | X-axis zero position | compact PDF + workbook |
| I0.1 | Y-axis zero position | compact PDF + workbook |
| I0.2 | liquid presence | compact PDF + workbook |
| I0.3 | Z-axis upper position | compact PDF + workbook |
| I0.4 | Z-axis lower position | compact PDF + workbook |
| I0.5 | stepper zero position | compact PDF + workbook |
| I0.6 | cup presence | compact PDF + workbook |
| I0.7 | air presence | compact PDF + workbook |
| I1.0 | X encoder channel A | compact PDF + workbook |
| I1.1 | X encoder channel B | compact PDF + workbook |
| I1.2 | Y encoder channel A | compact PDF + workbook |
| I1.3 | Y encoder channel B | compact PDF + workbook |
| I1.4 | suction-water flow meter | workbook only; absent from compact PDF |
| I1.5 | Z dosage position | compact PDF + workbook |
| I1.5 | stepper high-speed-counter clock | conflicting workbook note; must be resolved |

## Address conflicts

A workbook variant assigns stepper outputs to Q1.0/Q9.0/Q9.1 rather than Q9.0/Q9.1/Q9.2. The actual expansion-module addressing and TIA hardware configuration must decide the authoritative map.

## Safety warning

This table is documentation, not permission to force outputs. Output tests require an authorised procedure, isolated loads where appropriate and verified stop/safety functions.
