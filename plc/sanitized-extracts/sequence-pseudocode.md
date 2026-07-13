# Sequence Pseudocode — Non-Deployable Reconstruction

```text
CASE state OF
    IDLE:
        IF load_accepted AND start_request THEN state := CHECK_HOME

    CHECK_HOME:
        IF axes_homed THEN state := LOAD_TARGET
        ELSE state := HOMING

    HOMING:
        IF homing_failed THEN state := FAULT
        ELSIF axes_homed THEN state := LOAD_TARGET

    LOAD_TARGET:
        IF index >= point_count THEN state := COMPLETE
        ELSE
            target_x := points_x[index]
            target_y := points_y[index]
            state := MOVE_XY

    MOVE_XY:
        IF motion_timeout OR permissive_lost THEN state := FAULT
        ELSIF x_arrived AND y_arrived THEN state := DOSING_ACTION

    DOSING_ACTION:
        IF action_timeout THEN state := FAULT
        ELSIF action_complete THEN state := ADVANCE

    ADVANCE:
        index := index + 1
        state := LOAD_TARGET

    COMPLETE:
        run_complete := TRUE
        IF reset THEN state := IDLE

    FAULT:
        all_motion_outputs := FALSE
        IF authorised_reset AND fault_cause_removed THEN state := IDLE
END_CASE
```

Timeout/fault branches are good-practice requirements and are not asserted to exist in the archived logic.
