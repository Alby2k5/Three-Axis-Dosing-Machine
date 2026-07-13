' Clean-room WinCC VBScript example.
' Purpose: append X;Y;timestamp to a configured audit file.
' This is not a real-time logger and is not a substitute for a validated trace.

Sub AppendDosingPointToCsv()
    On Error Resume Next

    Const ForAppending = 8
    Dim fso, fileHandle, filePath, lineText
    Dim xValue, yValue

    Err.Clear
    filePath = Trim(CStr(SmartTags("CFG_CSV_EXPORT_PATH")))
    xValue = SmartTags("HMI_EXPORT_X")
    yValue = SmartTags("HMI_EXPORT_Y")

    If Len(filePath) = 0 Then
        ShowSystemAlarm "CSV export: no file path configured."
        Exit Sub
    End If

    If Not IsNumeric(xValue) Or Not IsNumeric(yValue) Then
        ShowSystemAlarm "CSV export: X and Y must be numeric."
        Exit Sub
    End If

    Set fso = CreateObject("Scripting.FileSystemObject")
    If Err.Number <> 0 Then
        ShowSystemAlarm "CSV export: cannot create file-system object."
        Exit Sub
    End If

    Err.Clear
    Set fileHandle = fso.OpenTextFile(filePath, ForAppending, True)
    If Err.Number <> 0 Then
        ShowSystemAlarm "CSV export: cannot open output file."
        Exit Sub
    End If

    lineText = CStr(CDbl(xValue)) & ";" & CStr(CDbl(yValue)) & ";" & CStr(Now)
    fileHandle.WriteLine lineText
    fileHandle.Close

    If Err.Number <> 0 Then
        ShowSystemAlarm "CSV export: write error #" & CStr(Err.Number) & "."
    Else
        ShowSystemAlarm "CSV export completed."
    End If

    Set fileHandle = Nothing
    Set fso = Nothing
End Sub
