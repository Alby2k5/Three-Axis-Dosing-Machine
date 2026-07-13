
# Matrice delle competenze e delle evidenze

| Competenza | Attività svolta | File o sezione che la dimostra | Stato / limite |
|---|---|---|---|
| Automazione industriale | Ricostruzione di assi, azionamenti, sensori, interfacce e modi operativi | `README.md`, `docs/system-architecture.md`, `docs/hardware-architecture.md` | osservato/documentato |
| PLC Siemens S7-1200 | Inventario progetti V15, mappa funzionale e piano di verifica | `docs/plc-program.md`, `plc/block-map.md`, `metadata/inventory-summary.md` | compilazione non eseguita |
| Ladder Logic | Ricostruzione di homing, direzione, velocità e arrivo in finestra | `plc/sanitized-extracts/motion-control-pseudocode.md` | pseudocodice, non export originale |
| TIA Portal V15 | Identificazione di 12 `.ap15`, 6 `.zap15` e target HMI V15 | `docs/source-register.md`, `metadata/version-comparison.md` | richiede apertura/compile in TIA |
| HMI | Ricostruzione delle quattro aree e dei target KTP700/PC | `docs/hmi-and-vbscript.md`, `hmi/screen-map.md` | runtime non testato |
| WinCC VBScript | Analisi di read/write/vector transfer e riscrittura sanitizzata | `hmi/sanitized-scripts/` | esempi clean-room da mappare ai tag |
| Gestione CSV | Contratto, validazione campi/numeri/capacità, fixture errate | `docs/csv-import.md`, `examples/csv/`, `tests/test_csv_contract.m` | implementato nel pubblico; originale meno robusto |
| Sistemi cartesiani | Analisi X/Y/Z, homing, target e sequenza | `docs/project-overview.md`, `plc/sequence-description.md` | logica esatta da verificare |
| Controllo del moto | Studio di errore, velocità a due livelli, frenata e assestamento | `docs/motion-analysis.md`, `matlab/scripts/analyze_motion_profile.m` | modello ideale; nessuna misura |
| Encoder/HSC | Tracciamento canali A/B e parametri mancanti | `docs/encoder-and-sampling.md`, `plc/io-map.md` | risoluzione/campionamento ignoti |
| MATLAB | Parsing, distanza, tempi, profili, campionamento e quantizzazione | `matlab/functions/`, `matlab/scripts/` | codice creato; esecuzione MATLAB pendente |
| Ottimizzazione traiettorie | Confronto open-path con euristica nearest-neighbour | `matlab/scripts/compare_path_ordering.m`, `docs/trajectory-optimization.md` | simulazione sintetica, non installata |
| Analisi versioni | Hash, duplicati, date interne e selezione per sottosistema | `metadata/inventory-summary.md`, `metadata/version-comparison.md`, `docs/source-register.md` | nessun master universale dichiarato |
| Validazione | Matrice requisito/implementazione/fonte/metodo/stato | `docs/verification-matrix.md`, `docs/testing.md` | prove fisiche/TIA mancanti dichiarate |
| Ripristino elettrico | Definizione di controlli e registri necessari; distinzione da attività non documentate | `docs/electrical-restoration.md` | nessuna riparazione attribuita senza log |
| Sicurezza macchina | Individuazione di dispositivi visibili e gap di validazione | `docs/hardware-architecture.md`, `docs/security-review.md` | nessuna conformità dichiarata |
| Technical writing | Separazione tra fatto, recupero, simulazione, proposta e ignoto | intero repository, `PROJECT_SCOPE.md` | deliverable pubblico |
| Git/GitHub | Struttura repo, ignore, changelog, licenza e guida di push | `.gitignore`, `CHANGELOG.md`, `PUBLICATION_CHECKLIST.md`, guida pubblicazione | pronto al push dopo controlli manuali |
| Privacy/licenze | Esclusione di file TIA, schemi, nomi, IP, seriali e raw photo | `private_archive_manifest/excluded-files.md`, `docs/security-review.md` | revisione umana finale necessaria |
| Comunicazione CV | Versioni IT/EN, bullet, domande e risposta sul contributo | `CV_PROJECT_ENTRY.md`, `PERSONAL_CONTRIBUTION.md` | da personalizzare con prove individuali |
