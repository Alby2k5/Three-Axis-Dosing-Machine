' Clean-room handshake example. Generic tags must be mapped and reviewed.
' The PLC must validate point count, coordinate ranges, homing and machine
' permissives before setting PLC_CSV_ACCEPTED.

Sub RequestCsvTransferToPlc()
    On Error Resume Next

    If SmartTags("HMI_CSV_LOAD_OK") <> True Then
        ShowSystemAlarm "CSV transfer: no validated file is loaded."
        Exit Sub
    End If

    If SmartTags("PLC_SEQUENCE_BUSY") = True Then
        ShowSystemAlarm "CSV transfer: sequence is busy."
        Exit Sub
    End If

    SmartTags("HMI_CSV_LOAD_REQUEST") = True
    SmartTags("HMI_CSV_REQUEST_ID") = SmartTags("HMI_CSV_REQUEST_ID") + 1

    ShowSystemAlarm "CSV transfer requested; waiting for PLC validation."
End Sub
