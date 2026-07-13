# CSV Examples

The legacy-compatible separator is a semicolon. Files have no header.

| File | Expected result |
|---|---|
| `valid-two-field.csv` | accepted; X and Y only |
| `valid-three-field.csv` | accepted; third field retained as annotation |
| `invalid-field-count.csv` | rejected on line 2 |
| `invalid-nonnumeric.csv` | rejected on line 2 |

Coordinates are examples in count units, not calibrated millimetres. Physical travel limits must be supplied by the machine configuration and enforced in the PLC.
