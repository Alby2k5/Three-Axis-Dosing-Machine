# Source and Conflict Register

The public repository uses source identifiers so that personal names and private paths need not be repeated.

| ID | Private source class | Best use | Reliability and limits |
|---|---|---|---|
| **SRC-A** | Motion-focused TIA V15 snapshot, PC HMI build dated 2023-12-05; inherited KTP build dated 2023-11-27 | X/Y motion, counters, in-range and two-speed terms | Strong for searchable motion semantics; not compiled here |
| **SRC-B** | Stand-alone import/export TIA snapshot, PC HMI build dated 2022-11-24, with sample CSV | VBScript file I/O and early CSV format | Strong for isolated CSV behavior; not full machine logic |
| **SRC-C** | Two snapshots explicitly stored under a working-baseline folder, including CSV and velocity variants | Historical working baseline and feature comparison | “Working” is a folder label, not a reproduced test result |
| **SRC-D** | Sequence/CSV TIA snapshot, PC HMI build dated 2023-12-14; inherited KTP build dated 2023-11-27 | Sequence integration and later PC runtime | Latest internal HMI timestamp among priority snapshots; newer does not prove deployed correctness |
| **SRC-E** | 2022/2023 student report | Four HMI modes, inertia/arrival-band narrative, two-speed behavior | Descriptive, not a test report |
| **SRC-F** | I/O PDF and interface workbooks | Signals, connectors, interface design, project notes | Some sheets conflict; use compact I/O PDF as baseline and record divergences |
| **SRC-G** | 47-page manufacturer electrical package | Original machine wiring and subsystem context | Third-party, serialised and excluded from publication |
| **SRC-H** | 17 later photographs | Physical architecture and visible cabinet hardware | Proves presence/appearance, not electrical integrity or operation |
| **SRC-I** | Shared-drive chronology screenshot | Approximate historical sequence of named archives | Contains personal/organisational data and is excluded |

## Priority by subsystem

| Subsystem | Primary source | Corroboration | Reason |
|---|---|---|---|
| CSV read/write | SRC-B | SRC-A, SRC-C, SRC-D | Isolated scripts plus source CSV; later copies show integration |
| X/Y motion | SRC-A | SRC-C, SRC-E | Motion-focused label and recovered counter/in-range/speed terms |
| Automatic sequence | SRC-D | SRC-E, SRC-A | Explicit sequence scope and latest PC HMI build |
| Historical working baseline | SRC-C | archived `.zap15` chronology | Stored as working variants; functional result not reproduced |
| I/O assignment | compact SRC-F PDF | SRC-F workbook, SRC-H | PDF is internally concise; workbook adds signals but also conflicts |
| Current visible hardware | SRC-H | SRC-F, SRC-G | Photographs supersede design intent for what was physically present on the inspection date |

## Confirmed conflicts

1. **PLC CPU:** design workbook says S7-1215C; cabinet photograph reads CPU 1214C DC/DC/DC.
2. **Input `I1.5`:** compact PDF maps Z dosage position; a workbook also labels it as stepper high-speed-counter clock.
3. **Stepper outputs:** compact PDF uses Q9.0/Q9.1/Q9.2; a workbook variant shifts the first assignment to Q1.0 and uses Q9.0/Q9.1 for the remaining outputs.
4. **CSV rows:** examples contain both `X;Y` and `X;Y;timestamp`; no formal schema/version field exists.
5. **Project chronology:** filesystem extraction dates are not trustworthy; internal HMI build dates and the chronology screenshot are used instead.

## Selection rule

No project is declared the universal master. A private TIA review must compare hardware configuration, block checksums, HMI tag bindings and online target state before selecting a deployable source.
