# Tests

## Automated MATLAB contract test

```matlab
cd tests
addpath('../matlab/functions')
test_csv_contract
```

The test checks valid two/three-field files, malformed field count, non-numeric data, point-count limits, distance calculation and nearest-neighbour output shape.

## Manual engineering tests

The following require the private project and/or machine and are not performed by this repository:

- TIA Portal open/compile and hardware configuration comparison;
- HMI tag/script validation;
- physical I/O truth table and continuity;
- homing, direction, travel-limit and timeout behavior;
- encoder calibration and maximum frequency;
- stopping error/repeatability under several speeds and directions;
- Z/plunger action and process quantity;
- E-stop, optical device, restart inhibition and safety validation.

Use `docs/verification-matrix.md` as the acceptance matrix.
