# Publication Checklist

Complete every unchecked item before pushing to a public remote.

## Identity and confidentiality

- [ ] Confirm that no personal names are present unless each person consented.
- [ ] Confirm that no IP address, machine serial number, school/shared-drive name or local Windows path is present.
- [ ] Inspect every image at full resolution; do not rely only on file names.
- [ ] Strip EXIF/GPS metadata from all public images.
- [ ] Keep the raw photo ZIP outside the repository.

## Engineering files and third-party material

- [ ] Do not add `.ap15`, `.zap15`, compiled WinCC packages, `PEData.*`, `XRef.db` or recipe archives.
- [ ] Do not publish the manufacturer electrical drawing set without written permission.
- [ ] Do not publish original spreadsheets, shared-drive screenshots or reports containing personal data.
- [ ] Confirm that the MIT licence covers only newly authored repository material.

## Technical accuracy

- [ ] Open the selected private project in TIA Portal V15 and record compile diagnostics.
- [ ] Verify the actual CPU/module configuration (1214C photograph versus 1215C design record).
- [ ] Resolve the `I1.5` address conflict.
- [ ] Verify tag names, array bounds, sequence index limits and HMI handshakes.
- [ ] Measure encoder scale, travel limits, sampling/update rate, stopping error and repeatability.
- [ ] Validate homing, direction, limit switches, E-stop and optical safety functions under an approved test plan.
- [ ] Replace all illustrative MATLAB parameters with measured/configured values before reporting machine timing.

## Contribution and CV

- [ ] Confirm which tasks were personally performed and retain evidence (notes, commits, test sheets).
- [ ] Obtain agreement before naming collaborators.
- [ ] Remove unsupported claims such as “implemented”, “restored” or “optimised” where only analysis exists.
- [ ] Keep CV bullets consistent with `PERSONAL_CONTRIBUTION.md` and `TECHNICAL_SKILLS_EVIDENCE.md`.

## Repository quality

- [ ] Run the Markdown link checker.
- [ ] Run the privacy/secret scan in the publication guide.
- [ ] Run MATLAB tests in the target MATLAB release and commit the test log.
- [ ] Regenerate figures and confirm units/legends.
- [ ] Review the ZIP contents before upload.
