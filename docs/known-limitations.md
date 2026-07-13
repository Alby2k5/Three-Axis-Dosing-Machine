# Known Limitations

1. **No canonical deployed project:** archive labels and internal dates do not identify the last downloaded PLC/HMI version.
2. **No TIA compile:** exact blocks, networks, tag types, hardware configuration and diagnostics remain private/unverified.
3. **No physical measurements:** accuracy, repeatability, speed, acceleration, braking, cycle time and settling are unknown.
4. **No encoder calibration:** coordinates cannot be converted from counts to millimetres.
5. **Conflicting records:** CPU model, `I1.5` function and stepper outputs differ between sources.
6. **Compiled script recovery:** original VBScript was reconstructed from searchable compiled data; published scripts are clean-room examples.
7. **Safety unknown:** visible protective devices do not establish compliance or validated function.
8. **Photographic date versus operational state:** photographs show a later state but no power-on or functional evidence.
9. **Attribution uncertainty:** multiple contributors appear in the private archive; per-block ownership is unknown.
10. **MATLAB preview provenance:** PNG previews were generated from equivalent formulas because MATLAB/Octave was unavailable in the build environment.
11. **Optimisation scope:** nearest-neighbour analysis ignores process precedence and machine constraints.
12. **Third-party exclusion:** manufacturer drawings and raw Siemens project material cannot be audited from the public ZIP.
