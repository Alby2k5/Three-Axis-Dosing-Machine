# System Architecture

## Functional boundary

The reconstructed control boundary starts at HMI commands or a CSV file and ends at PLC output commands. It does not include verified drive parameter sets, motor transfer functions or safety certification.

```mermaid
flowchart TB
    subgraph Operator
      HMI1[KTP700 Basic PN]
      HMI2[WinCC Runtime Advanced on PC]
      CSV[Local CSV file]
    end
    subgraph Control
      VBS[VBScript file handling]
      PLC[S7-1200 PLC]
      HSC[X/Y high-speed counters]
      SEQ[Sequence state/index]
    end
    subgraph Field
      IFACE[5 V / 24 V opto-isolated interface]
      DRV[X and Y drives]
      Z[Z relays/actuator]
      STP[Stepper plunger]
      SNS[Zero, end-position and process sensors]
      ENC[Incremental encoders A/B]
    end
    CSV --> VBS --> HMI2
    HMI1 --> PLC
    HMI2 --> PLC
    PLC --> SEQ
    ENC --> HSC --> PLC
    SNS --> PLC
    PLC --> IFACE --> DRV
    IFACE --> Z
    IFACE --> STP
    PLC --> HMI1
    PLC --> HMI2
```

## Control responsibilities

- **HMI:** mode selection, manual commands, coordinate entry, status and file-load request.
- **VBScript:** non-real-time local file access and transfer into HMI tags.
- **PLC:** deterministic permissives, counters, target comparison, output arbitration and sequence transitions.
- **Drives/interface:** electrical adaptation and motor command execution.
- **MATLAB:** offline evaluation only; no direct connection to the PLC is supplied.

## Trust boundaries

CSV and HMI inputs are untrusted until validated. A valid file is not sufficient to authorise motion: PLC range, homing, sensor, mode and safety conditions must remain authoritative.
