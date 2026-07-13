# Motion-Control Pseudocode — Non-Deployable Reconstruction

This pseudocode illustrates the recovered intent. It is not Siemens source and must not be downloaded to a machine.

```text
IF stop_or_fault OR NOT motion_permitted THEN
    axis.run := FALSE
    axis.speed_low := FALSE
    axis.speed_high := FALSE
ELSIF target_valid AND axis_homed THEN
    error := target_count - actual_count

    IF ABS(error) <= arrival_tolerance THEN
        axis.run := FALSE
        axis.arrived := TRUE
    ELSE
        axis.arrived := FALSE
        axis.direction_positive := (error > 0)

        IF departure_phase OR ABS(error) <= deceleration_band THEN
            axis.speed_low := TRUE
            axis.speed_high := FALSE
        ELSE
            axis.speed_low := FALSE
            axis.speed_high := TRUE
        END_IF

        axis.run := TRUE
    END_IF
END_IF
```

Unknown original details: tolerance, deceleration band, departure logic, hysteresis, timeout, counter scaling, drive truth table and final output mapping.
