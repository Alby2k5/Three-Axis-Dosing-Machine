# Security and Publication Review

## Sensitive material found in the private archive

- absolute Windows paths, including user profile and school/project folders;
- an IP-address label visible in a cabinet photograph;
- machine serial number and identification plate;
- personal names in project folders, HMI author fields, spreadsheets and shared-drive screenshots;
- school/shared-drive names;
- full TIA project data and compiled HMI runtime packages;
- manufacturer wiring drawings and branded documents;
- runtime recipe/CSV artifacts and temporary/back-up files.

## Public controls applied

- no `.ap15` or `.zap15` files;
- no `PEData.*`, `XRef.db`, compiled HMI packages, PDF/XLSX/DOCX sources or full-resolution photos;
- source identifiers replace contributor names inside the public repository;
- example scripts use configurable paths and generic tag names;
- two photos are cropped/downscaled, metadata-stripped and checked for plate/IP visibility;
- raw evidence paths exist only in the separate private analysis report/manifest;
- `.gitignore` blocks common accidental additions.

## Residual risks

Automated scans cannot detect every logo, reflection, handwritten note, screenshot or contextual identity. A human must inspect the final Git tree and the rendered images before publication.

## Recommended command checks

```bash
git ls-files -z | xargs -0 grep -nEI \
  '([0-9]{1,3}\.){3}[0-9]{1,3}|[A-Za-z]:\\\\|password|passwd|secret|token' || true

git ls-files | grep -Ei '\.(ap1[1-9]|zap1[1-9]|pdf|xlsx|docx)$' && exit 1 || true

git diff --check
```

Use a dedicated secret scanner as an additional control if available.
