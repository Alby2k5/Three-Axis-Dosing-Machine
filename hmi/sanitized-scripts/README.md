# Sanitised VBScript Examples

These scripts are clean-room, readable examples derived from the behavior visible in compiled project search data. They are **not** original source exports.

Before use:

1. replace generic `SmartTags` names with reviewed HMI/PLC tags;
2. confirm WinCC target syntax and array transfer support;
3. configure a controlled import/export folder;
4. add calibrated PLC range checks and a data-accept handshake;
5. test on a simulation/offline target before any machine connection.

The scripts keep file validation local and transfer arrays only after the complete file passes basic checks. Safety and motion authorisation remain PLC responsibilities.
