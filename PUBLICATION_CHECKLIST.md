# Publication and Validation Status

**Last review:** 2026-07-13  
**Scope:** public technical case-study repository only; this is not a deployable machine-control release or a machine-validation certificate.

## How to read this document


The repository is already public. The tables below distinguish:

- checks completed for the **public documentation package**;
- validation activities that still require MATLAB, TIA Portal V15 or the physical machine;
- items that limit technical claims but do not turn the published documentation into validated control software.

Open technical-validation items must not be presented as completed measurements, commissioning evidence, safety validation or production-ready behavior.

## Release status

| Item | Status | Meaning |
|---|---|---|
| Public technical documentation | **Published** | Sanitized case study, documentation, simulations and non-deployable examples are available. |
| Deployable PLC/HMI control software | **Not published** | Complete TIA Portal projects and compiled runtime packages are intentionally excluded. |
| MATLAB runtime compatibility | **Open** | Static review was completed, but execution in a target MATLAB release is still required. |
| Physical-machine performance | **Not validated** | Accuracy, repeatability, encoder scale, stopping error and cycle time were not measured in this repository. |
| Safety validation | **Not claimed** | No machine-specific risk assessment or approved safety test is included. |

## Public-package checks

| Check | Status | Date | Evidence / note |
|---|---|---|---|
| Source archive integrity | **Completed** | 2026-07-13 | `metadata/build-validation.md` |
| Public file inventory | **Completed** | 2026-07-13 | No unexpected large binaries or symlinks reported in `metadata/build-validation.md`. |
| Exclusion of private engineering formats | **Completed** | 2026-07-13 | No `.ap15`, `.zap15`, `.alXX`, `.pdf`, `.xlsx` or `.docx` files in the public tree. |
| Markdown relative links | **Completed** | 2026-07-13 | Recorded in `metadata/build-validation.md`. |
| Personal-name, path and secret scan | **Completed** | 2026-07-13 | Recorded in `metadata/build-validation.md`. |
| EXIF/GPS removal from public images | **Completed** | 2026-07-13 | Both public JPEGs were reported without EXIF tags. |
| Git whitespace check | **Completed** | 2026-07-13 | `git diff --cached --check` passed during packaging. |
| Final public ZIP integrity | **Completed** | 2026-07-13 | Recorded in `metadata/build-validation.md`. |
| Public/private licensing boundary | **Documented** | 2026-07-13 | See `LICENSE`, `NOTICE.md` and `private_archive_manifest/excluded-files.md`. |
| Rights to redistribute the two redacted photographs | **Completed** | Photographs were taken by the repository owner and published with permission. See `docs/assets/README.md`. |

## Technical validation status

| Check | Status | Required environment | Evidence / next action |
|---|---|---|---|
| Static MATLAB source review | **Completed** | None | See `metadata/build-validation.md`. |
| Run MATLAB contract tests | **Open** | Target MATLAB release | Track in issue #1 and commit the test log. |
| Regenerate figures in MATLAB | **Open** | Target MATLAB release | Track in issue #1; record MATLAB version and operating system. |
| Open and compile selected TIA project | **Open** | Licensed TIA Portal V15 | Record hardware, PLC and HMI compile diagnostics. |
| Identify the project actually downloaded to PLC/HMI | **Not verified** | Private project plus authorised online comparison | Do not claim a canonical deployed version until verified. |
| Resolve CPU configuration conflict | **Open** | TIA Portal V15 and hardware records | Photograph indicates CPU 1214C; a design record indicates 1215C. |
| Resolve `I1.5` assignment conflict | **Open** | TIA Portal V15, wiring review and controlled I/O test | Keep the conflict visible until resolved. |
| Verify tag names, array bounds and HMI handshake | **Open** | TIA Portal/WinCC V15 | Confirm the real PLC point-buffer size and transfer behavior. |
| Measure encoder scale and travel limits | **Not available** | Physical machine and test equipment | Do not convert count units to millimetres without calibration. |
| Measure stopping error, repeatability and cycle time | **Not available** | Physical machine and approved test plan | No measured performance is claimed. |
| Validate homing, limits, E-stop and optical protection | **Not available** | Physical machine, qualified personnel and approved safety plan | This repository is not safety-validation evidence. |

## Contribution and CV status

| Check | Status | Evidence / next action |
|---|---|---|
| Separation of pre-existing, collaborative, recovered, simulated and proposed work | **Documented** | `PERSONAL_CONTRIBUTION.md` |
| Confirmation of tasks personally performed by the repository owner | **Author confirmation required** | Add only activities that can be supported by notes, commits, reports, photographs or test sheets. |
| Consent before naming collaborators | **Required if names are added** | Keep collaborators anonymous unless permission is available. |
| Consistency between CV and repository | **Author review required** | Compare `CV_PROJECT_ENTRY.md`, `PERSONAL_CONTRIBUTION.md` and `TECHNICAL_SKILLS_EVIDENCE.md`. |

## Interpretation

This repository is suitable for review as a **documented engineering case study**. It must not be represented as:

- a compiled or deployable PLC/HMI release;
- evidence of completed machine commissioning;
- proof of measured positioning accuracy or cycle time;
- a validated safety function;
- a MATLAB compatibility certificate until the runtime tests are executed.

Open items are tracked transparently in this file and in `docs/verification-matrix.md`.
