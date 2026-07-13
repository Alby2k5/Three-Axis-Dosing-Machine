# Build Validation Record

**Build date:** 2026-07-13
**Scope:** public repository package only

## Automated checks completed

| Check | Result |
|---|---|
| Source archive integrity | Both supplied software ZIP copies passed archive testing and were byte-identical by SHA-256; the photo ZIP also passed archive testing. |
| Public file inventory | Repository enumerated; no symlinks and no unexpected large binary files found. |
| Forbidden source formats | No `.ap15`, `.zap15`, `.alXX`, `.pdf`, `.xlsx` or `.docx` files in the public tree. |
| Markdown links | All relative file links resolve in the build tree. |
| Personal-name scan | Selected names found in private sources are absent from the public tree. |
| Path/secret scan | No private Windows path, user home path, credential token or literal source IP address found; documented examples and product-version strings were manually distinguished from secrets/IPs. |
| Image metadata | Both public JPEGs contain no EXIF tags. |
| Git whitespace check | `git diff --cached --check` completed without whitespace errors during packaging. |
| ZIP integrity | Final public ZIP tested after creation. |

## Static MATLAB review

The `.m` files were checked for expected function/file naming, paired function terminators, local relative paths, explicit input validation and documented units/assumptions. The equations were independently exercised by a build-time reference implementation to generate preview figures and reference CSVs.

**Not completed:** MATLAB or GNU Octave execution, because neither runtime was available in the build environment. Therefore this record is not a MATLAB compatibility certificate. Execute `tests/run_all_tests.m` and `matlab/scripts/run_all_analyses.m` in the target MATLAB release before claiming MATLAB compatibility, presenting the preview figures as MATLAB-generated outputs, or reporting the model as runtime-validated.

## Validation not possible in this environment

- opening and compiling the private TIA Portal V15 projects;
- identifying the project actually downloaded to the PLC/HMI;
- live I/O, HSC, motion, homing, interlock or safety testing;
- encoder calibration, repeatability, stopping-error and cycle-time measurements;
- confirmation of individual authorship/contribution;
- legal confirmation of rights to redistribute the two redacted photographs.

These open items are tracked transparently in `PUBLICATION_CHECKLIST.md` and `docs/verification-matrix.md`; they do not represent completed machine validation.
