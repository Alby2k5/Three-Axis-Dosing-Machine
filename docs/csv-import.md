# CSV Import Contract

## Formats found in the private archive

Two families occur:

```text
X;Y
```

and

```text
X;Y;timestamp
```

One early sample mixes both forms in the same file. Another sample contains four points with a timestamp and one file lacks a final newline. No header, schema version or unit declaration is present.

## Public contract

| Property | Rule |
|---|---|
| Encoding | UTF-8 without BOM recommended |
| Separator | semicolon (`;`) |
| Header | none in legacy-compatible examples |
| Required fields | X and Y numeric values |
| Optional field | timestamp/text audit field; ignored by motion analysis |
| Decimal separator | dot recommended; locale-dependent comma is rejected by the public parser |
| Blank lines | ignored |
| Maximum points | configurable; public HMI example defaults to 1000 and rejects excess rows |
| Units | encoder-count units unless a verified calibration file is supplied |
| Range | PLC-calibrated limits; not hard-coded in public examples |

## Validation order

1. File exists and can be opened.
2. Each nonblank row has two or three fields.
3. X and Y are finite numeric values.
4. Point count is nonzero and within the configured capacity.
5. PLC range and machine-state checks pass.
6. Full vectors and count are committed atomically/through a handshake.

## Failure handling

The current sequence must not start with partially imported vectors. A file error should preserve the previous accepted program or clear it explicitly; the choice must be visible to the operator. The public example performs full local validation before tag transfer.

## Examples and tests

- [`examples/csv/valid-two-field.csv`](../examples/csv/valid-two-field.csv)
- [`examples/csv/valid-three-field.csv`](../examples/csv/valid-three-field.csv)
- [`examples/csv/invalid-field-count.csv`](../examples/csv/invalid-field-count.csv)
- [`examples/csv/invalid-nonnumeric.csv`](../examples/csv/invalid-nonnumeric.csv)
- [`tests/test_csv_contract.m`](../tests/test_csv_contract.m)

## Recommended future schema

A versioned file could add a comment or metadata sidecar containing coordinate units, machine calibration identifier, required homing state and checksum. That is a proposal, not an implemented legacy feature.
