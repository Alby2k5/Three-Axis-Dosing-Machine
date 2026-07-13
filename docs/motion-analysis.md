# Motion Analysis

## Documented behavior

The source report states that X/Y motors use a low speed near departure and arrival and a higher speed in the intermediate region. Semi-automatic motion stops inside a neighbourhood of the requested encoder coordinate, attributed to axis inertia.

## Position model

For an axis with target count `q*` and measured count `q`, define error:

```text
e = q* - q
```

Direction follows the sign of `e`. A practical arrival decision normally uses a band:

```text
arrived = |e| <= tolerance
```

The archive does not provide the tolerance, hysteresis or required dwell inside the band.

## Two-speed interpretation

A recovered functional interpretation is:

- low speed during departure or when `|e|` is inside a deceleration threshold;
- high speed when the target is farther away;
- stop when inside the arrival band.

Because the actual drives are commanded through discrete speed inputs, the PLC likely selects preset drive speeds rather than generating a continuous trajectory. Drive parameters and thresholds are unavailable.

## Inertia and stopping error

With a discrete speed command and finite braking, removing the run command does not guarantee immediate zero velocity. Stopping error can depend on:

- selected speed and drive deceleration ramp;
- moving mass and friction;
- mechanical backlash/compliance;
- PLC/HSC update and scan timing;
- contactor/relay and drive input delay;
- arrival tolerance and braking threshold;
- approach direction and load.

No measured stopping distribution is present. Accuracy and repeatability must therefore remain unverified.

## MATLAB kinematic model

The public MATLAB estimator uses an ideal symmetric triangular/trapezoidal profile for each segment:

- trapezoidal when the segment is long enough to reach configured maximum speed;
- triangular otherwise.

It excludes discrete drive speed presets, jerk, motor torque, load, backlash, Z/process actions and settling unless the user adds explicit dwell terms. Its output is a transparent estimate, not the machine cycle time.

## Minimum experiment for evidence

For each axis and at several targets/speeds, record requested count, stop count, approach direction, load condition and repeated trials. Report mean error, spread, worst case and calibration uncertainty. Convert to millimetres only after measuring counts per unit travel.
