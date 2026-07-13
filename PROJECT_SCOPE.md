# Project Scope

## Objective

Document and analyse a recovered three-axis dosing machine in a form that allows a lecturer, recruiter or automation engineer to verify the technical work without receiving the private control project or third-party material.

## In scope

- source inventory, hash-based duplicate detection and version comparison;
- reconstruction of machine, I/O, PLC/HMI/CSV and sequence architecture;
- clean-room examples that demonstrate safer CSV handling;
- MATLAB analysis in encoder-count units;
- traceability matrices, limitations and test planning;
- public/private publication controls;
- CV-ready wording tied to evidence.

## Out of scope

- asserting that any archived TIA snapshot is the deployed master;
- compiling or downloading the PLC/HMI project;
- changing the private `.ap15`/`.zap15` files;
- declaring a safety category or compliance level;
- commissioning, electrical modification or live-machine testing;
- measured accuracy, repeatability, cycle time, encoder resolution or sampling frequency;
- relicensing manufacturer or Siemens project material.

## Evidence classes

Every important statement is classified as observed, documented, recovered, simulated, proposed or unverified. See [README.md](README.md#purpose-and-evidence-status).

## Units

The archived coordinate examples are integer values associated with encoder pulses/counts. No verified mechanical scale is supplied. Public analyses therefore use **count units**. Conversion to millimetres requires a measured scale factor and an uncertainty estimate.

## Deliverable boundary

The repository is a technical study, not a deployable machine-control package. The private archive is preserved separately and unchanged.
