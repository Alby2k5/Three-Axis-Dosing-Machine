# HMI and VBScript

## HMI targets

Compiled metadata identifies:

- a **KTP700 Basic PN** target in inherited machine snapshots;
- a **WinCC Runtime Advanced** PC target;
- TIA/WinCC release **15.0.0.0**.

The source report describes four panel pages and one PC screen divided into the same four functional areas: manual, semi-automatic, automatic and stepper control.

## Recovered VBScript patterns

Searchable compiled data contains script names and fragments corresponding to:

- `Write_data_to_file`: append X, Y and timestamp to a semicolon-delimited file;
- `Read_data_from_file`: read a line, split fields and assign HMI values;
- `Read_vett`: read multiple rows into X/Y arrays, count points and pass arrays/count through SmartTags;
- `TransfHMItoPLC`: transfer HMI values to PLC-facing tags.

The original scripts are not published because they contain personal/local paths and compiled-project tokens. The examples under [`hmi/sanitized-scripts/`](../hmi/sanitized-scripts/) are newly written, readable equivalents, not byte-for-byte exports.

## Risks found in original patterns

- absolute Windows paths tied to individual computers and removable drives;
- broad `On Error Resume Next` behavior;
- inconsistent two-field and three-field CSV samples;
- no demonstrated strict numeric/range/schema checks;
- arrays dimensioned from 0 to 1000 with no visible bound guard in the recovered fragment;
- error messages without a structured file/line diagnostic;
- no demonstrated load-request/accept handshake to prevent partial data use;
- a recovered close call that appears inconsistent in one fragment and must be checked in the original editor.

## Public example design

The sanitised scripts:

- take the path from an HMI configuration tag;
- reject missing files, wrong field counts and non-numeric coordinates;
- enforce a maximum point count;
- use local arrays and transfer them only after the complete file passes validation;
- report the failing line;
- leave physical range checks authoritative in the PLC because verified travel limits are unavailable.

## HMI error model recommended

| Category | Example | Operator action |
|---|---|---|
| File | missing, unreadable, empty | select valid file |
| Schema | wrong separator/field count | correct export format |
| Data | non-numeric/NaN/overflow | correct indicated row |
| Capacity | too many points | split program or raise validated capacity |
| Machine | target outside calibrated travel | correct coordinates |
| State | not homed, permissive missing, sequence busy | resolve machine state |
| Motion | timeout or lost feedback | stop and diagnose; do not auto-continue |
