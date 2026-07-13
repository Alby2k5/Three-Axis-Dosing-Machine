# Project Overview

## Context

The source archive documents the reuse of an existing automatic dosing machine as an educational automation platform. The work evolved from direct HMI commands to coordinate positioning and automatic sequences. A later public-study phase reorganised the evidence, analysed the motion mathematically and prepared a publication-safe repository.

## Engineering objectives reconstructed from the archive

- control X, Y and Z mechanisms through a Siemens S7-1200;
- provide manual, semi-automatic, automatic and stepper-plunger controls;
- reference axes through homing sensors;
- use encoder counters to stop inside a target window;
- select low/high axis speeds according to motion phase;
- import point sequences from semicolon-delimited files;
- expose operator status and errors on KTP/PC HMI targets;
- study trajectory length, kinematic timing, sampling and point ordering offline.

## System layers

| Layer | Role |
|---|---|
| Mechanical | Cartesian X/Y gantry, vertical Z mechanism, dosing head and plunger |
| Power/actuation | X/Y motor drives, relays/contactors, stepper interface, 24 V control power |
| Field signals | zero sensors, Z end positions, process permissives, X/Y encoder A/B channels |
| PLC | counters, permissives, homing, direction/speed selection, sequence control |
| HMI | operator commands, coordinate entry, status, alarms and point-list controls |
| VBScript/CSV | local file import/export and array transfer |
| MATLAB | offline, non-real-time analysis and comparison |

## Study phases

1. **Original system:** commercial machine and manufacturer wiring.
2. **Educational retrofit:** S7-1200, interface boards, I/O mapping and HMI/PLC development.
3. **Archived functional iterations:** motion, CSV and sequence variants across 2022–2023.
4. **Later inspection:** photographs document the cabinet and mechanisms as found.
5. **Public technical study:** source comparison, sanitisation, MATLAB analysis and validation planning.

The evidence does not prove that every phase was completed on the same hardware configuration.
