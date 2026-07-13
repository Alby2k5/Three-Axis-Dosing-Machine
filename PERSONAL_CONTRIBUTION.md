# Personal Contribution

## Attribution rule

The archive contains several project snapshots, a 2022/2023 report with a named attribution, version folders carrying other contributor names, and a collaborative electrical-interface progress sheet. The repository owner is not identifiable from those records alone. This file therefore separates evidence categories and avoids assigning group work to one person.

## Contribution breakdown

| Area | What the evidence supports | Safe attribution |
|---|---|---|
| Original machine | Commercial DOSORAMA V40 machine, drives, mechanisms and manufacturer drawings predate the student project. | **Not student-designed.** |
| PLC/electrical retrofit | I/O mapping, S7-1200 interface, opto-isolated boards and wiring work appear in collaborative records. | **Collaborative; individual tasks require confirmation.** |
| 2022/2023 PLC/HMI application | An original report describes manual, semi-automatic, automatic and stepper pages and attributes that project to one student. | **Named in private evidence; do not reassign.** |
| Later TIA variants | Folder-level names identify additional contributors for motion and sequence/CSV variants. | **Version-level attribution only; exact block ownership uncertain.** |
| Recovery/restoration | The photographs show the later physical state, but no signed work log records who checked wiring, replaced parts or performed tests. | **Do not claim specific restoration operations without a personal log.** |
| Archive analysis | Inventory, source comparison, conflict detection, traceability and public/private separation were performed for this repository. | **New repository work.** |
| MATLAB | The scripts and functions under `matlab/` are newly organised analyses. They use source-derived or explicitly synthetic data and do not modify the machine. | **New analytical work; simulation, not experiment.** |
| Proposed improvements | CSV schema hardening, timeout/state handling, calibration experiments and route optimisation are recommendations. | **Proposed, not installed.** |

## What was already present

- the machine, mechanical axes, electrical cabinet and original wiring package;
- S7-1200/TIA Portal V15 project snapshots;
- HMI targets and compiled VBScript fragments;
- I/O worksheets and CSV examples;
- a functional narrative for the four HMI operating areas;
- multiple historical project versions and archived working/test labels.

## What was added in the public study

- a source and conflict register;
- a sanitised I/O and block map;
- clean-room VBScript examples with configurable paths and stricter input checks;
- MATLAB functions for distance, motion-time profiles, route ordering, sampling and quantisation;
- test fixtures, verification matrix, security review and publication guide;
- CV wording linked to files that can be inspected.

## What cannot be attributed from the archive

- who authored each Ladder network or HMI screen;
- who performed a specific cable, continuity or live I/O test;
- which TIA project was actually downloaded last;
- whether the photographed machine was operational;
- whether any route optimisation was deployed on the PLC.

## CV-safe contribution statement

Use the following only after confirming it against personal records:

> I contributed to the recovery and engineering analysis of an existing three-axis dosing machine. I compared archived Siemens TIA Portal versions, traced the HMI/CSV/PLC data flow, documented the I/O and motion sequence, and developed MATLAB analyses for path length, kinematic timing and point ordering. The original machine and part of the PLC/HMI retrofit were pre-existing collaborative work, so I distinguish my later analysis and documentation from the historical implementation. I do not claim measured performance where no test record exists.

Delete any clause that is not personally true and add a dated work log or commit history before publication.
