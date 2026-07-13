# Encoder and Sampling Analysis

## Evidence

The I/O map assigns:

- X encoder channel A to `I1.0` and B to `I1.1`;
- Y encoder channel A to `I1.2` and B to `I1.3`.

TIA search terms refer to two high-speed counters. A photograph shows an incremental encoder, but its complete type code and resolution are not legible.

## Unknown parameters

- pulses per revolution;
- PLC quadrature mode/multiplier;
- mechanical transmission ratio;
- axis travel per motor/encoder revolution;
- maximum pulse frequency;
- HSC filter configuration;
- PLC scan/update time and HMI refresh rate;
- whether the encoder is motor-side or load-side for every axis.

## Resolution

If `N` effective counts correspond to travel `L`, one count represents:

```text
Delta_x = L / N
```

Neither `L` nor `N` is verified. Therefore this repository does not publish a physical resolution.

## Sampling

High-speed-counter acquisition and PLC program observation are different layers. The counter may capture edges asynchronously while the control logic reads a count once per scan or task. HMI refresh is slower again. A meaningful analysis must distinguish:

1. encoder edge frequency;
2. hardware counter acquisition/filtering;
3. PLC update/read interval;
4. control decision interval;
5. HMI display/log interval.

## Public simulation

`matlab/scripts/analyze_sampling_quantization.m` evaluates ideal sample-and-hold and quantisation error for user-specified intervals and count quanta. It does not model missed pulses, electrical noise, HSC filters or mechanical error.

## Verification method

- read the encoder label or datasheet and record exact part number;
- export the HSC configuration from TIA Portal;
- measure travel over a known count interval with a traceable instrument;
- test maximum commanded speed and compare expected/measured edge frequency;
- record PLC timestamps or use a trace to determine decision/update timing.
