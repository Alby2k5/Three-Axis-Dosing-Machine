' Clean-room WinCC VBScript example.
' Purpose: read X;Y[;annotation] rows and transfer complete arrays only after
'          validation. Generic tag names must be mapped before use.
' Units: encoder-count units unless the PLC applies a verified calibration.
' Limits: WinCC target syntax/array semantics must be validated in TIA V15.

Sub ImportDosingCsv()
    On Error Resume Next

    Const ForReading = 1
    Const MaxPoints = 1000

    Dim fso, fileHandle, filePath, rawLine, fields
    Dim xValues(999), yValues(999)
    Dim pointCount, lineNumber, xValue, yValue, errorText

    Err.Clear
    filePath = Trim(CStr(SmartTags("CFG_CSV_PATH")))
    pointCount = 0
    lineNumber = 0
    errorText = ""

    If Len(filePath) = 0 Then
        ShowSystemAlarm "CSV import: no file path configured."
        Exit Sub
    End If

    Set fso = CreateObject("Scripting.FileSystemObject")
    If Err.Number <> 0 Then
        ShowSystemAlarm "CSV import: cannot create file-system object."
        Exit Sub
    End If

    If Not fso.FileExists(filePath) Then
        ShowSystemAlarm "CSV import: file not found."
        Exit Sub
    End If

    Err.Clear
    Set fileHandle = fso.OpenTextFile(filePath, ForReading, False)
    If Err.Number <> 0 Then
        ShowSystemAlarm "CSV import: cannot open file."
        Exit Sub
    End If

    Do While Not fileHandle.AtEndOfStream
        rawLine = Trim(fileHandle.ReadLine)
        lineNumber = lineNumber + 1

        If Len(rawLine) > 0 Then
            fields = Split(rawLine, ";")

            If UBound(fields) <> 1 And UBound(fields) <> 2 Then
                errorText = "CSV import: wrong field count at line " & CStr(lineNumber) & "."
                Exit Do
            End If

            If Not IsNumeric(Trim(fields(0))) Or Not IsNumeric(Trim(fields(1))) Then
                errorText = "CSV import: non-numeric coordinate at line " & CStr(lineNumber) & "."
                Exit Do
            End If

            If pointCount >= MaxPoints Then
                errorText = "CSV import: point limit exceeded."
                Exit Do
            End If

            xValue = CDbl(Trim(fields(0)))
            yValue = CDbl(Trim(fields(1)))
            xValues(pointCount) = xValue
            yValues(pointCount) = yValue
            pointCount = pointCount + 1
        End If
    Loop

    fileHandle.Close
    Set fileHandle = Nothing
    Set fso = Nothing

    If Err.Number <> 0 And Len(errorText) = 0 Then
        errorText = "CSV import: read error #" & CStr(Err.Number) & "."
    End If

    If Len(errorText) > 0 Then
        ShowSystemAlarm errorText
        SmartTags("HMI_CSV_LOAD_OK") = False
        Exit Sub
    End If

    If pointCount = 0 Then
        ShowSystemAlarm "CSV import: file contains no points."
        SmartTags("HMI_CSV_LOAD_OK") = False
        Exit Sub
    End If

    ' Physical range checks must be performed by the PLC against calibrated
    ' axis limits before accepting a run request.
    SmartTags("HMI_X_POINTS") = xValues
    SmartTags("HMI_Y_POINTS") = yValues
    SmartTags("HMI_POINT_COUNT") = pointCount
    SmartTags("HMI_CSV_LOAD_OK") = True
    SmartTags("HMI_CSV_LOAD_REQUEST") = True

    ShowSystemAlarm "CSV import completed: " & CStr(pointCount) & " points pending PLC validation."
End Sub
