# CV Project Entry

> **Use condition:** retain only statements that match your personal work log. The archive contains multiple contributors and does not identify the repository owner.

## Versione italiana sintetica

**Analisi e recupero di una macchina dosatrice cartesiana a tre assi**

Confronto di progetti Siemens TIA Portal V15, ricostruzione del flusso HMI–VBScript–CSV–PLC e documentazione di I/O, homing e logica di posizionamento. Sviluppo successivo di script MATLAB per traiettorie, profili cinematici e ordinamento dei punti. Prestazioni e precisione non sono dichiarate in assenza di prove tracciabili.

## Short English version

**Recovery and analysis of a three-axis Cartesian dosing machine**

Compared Siemens TIA Portal V15 project snapshots and reconstructed the HMI–VBScript–CSV–PLC flow, I/O, homing and positioning logic. Added MATLAB scripts for trajectory, kinematic-profile and point-order analyses. No performance or accuracy claim is made without traceable measurements.

## Punti per il CV

1. Compared archived **Siemens TIA Portal V15** projects to trace PLC/HMI functions, version conflicts and the evidence behind each subsystem.
2. Reconstructed **Ladder-based motion and sequence logic** for homing, direction, two-speed travel and arrival-band detection from project metadata and technical records.
3. Analysed and hardened the **WinCC VBScript / CSV** interface through configurable paths, schema checks, numeric validation and bounded point arrays.
4. Developed **MATLAB** tools to visualise paths, compute travel distance, estimate triangular/trapezoidal motion time and compare point orderings under explicit assumptions.
5. Produced an auditable **GitHub engineering repository** with I/O maps, validation matrix, limitations, publication exclusions and contribution boundaries.

## Competenze associabili

| Categoria | Competenze |
|---|---|
| Automazione | sistemi cartesiani, sensori/attuatori, homing, motion sequence, interblocchi, HMI |
| Programmazione | Ladder Logic, PLC S7-1200, VBScript, parsing CSV, MATLAB |
| Analisi | confronto versioni, profili posizione/velocità/accelerazione, quantizzazione, campionamento, route ordering |
| Strumenti | Siemens TIA Portal V15, WinCC Runtime Advanced, KTP700 Basic, MATLAB, Git/GitHub |
| Documentazione | architettura, I/O map, tracciabilità, test plan, security review, limitations |

## Domande da colloquio

1. **Perché non hai pubblicato i progetti TIA completi?**

   Contengono dati tecnici e personali, pacchetti compilati e materiale la cui licenza non è chiara. Ho pubblicato mappe, pseudocodice ed evidenze minime, mantenendo gli originali privati.

2. **Come hai scelto la versione di riferimento?**

   Non ho imposto una sola “ultima versione”. Ho usato fonti diverse per moto, CSV, baseline funzionante e sequenza, registrando conflitti e date HMI interne.

3. **Come avviene l’importazione CSV?**

   Il VBScript apre un file con `FileSystemObject`, legge righe separate da punto e virgola, costruisce vettori X/Y e trasferisce vettori e numero di punti tramite tag HMI/PLC. Nel repository ho aggiunto controlli mancanti.

4. **Qual è il problema principale degli script originali?**

   Percorsi locali hard-coded, gestione errori permissiva e assenza dimostrata di controlli completi su formato, tipo, limite punti e range macchina.

5. **Come viene gestito il posizionamento X/Y?**

   Le fonti descrivono direzione, due livelli di velocità, contatori encoder e una finestra di arrivo. La rete Ladder esatta deve essere verificata in TIA Portal.

6. **Perché parli di “count units” e non millimetri?**

   Manca una calibrazione verificabile tra impulsi encoder e spostamento fisico. Convertire senza misura introdurrebbe un dato inventato.

7. **Come stimi il tempo di movimento in MATLAB?**

   Uso un profilo triangolare o trapezoidale in funzione di distanza, velocità massima e accelerazione fornite dall’utente. Il risultato è una simulazione cinematica, non un tempo ciclo misurato.

8. **Che ottimizzazione hai implementato?**

   Una euristica nearest-neighbour per ridurre la distanza di un percorso aperto. Non garantisce l’ottimo globale e non considera vincoli di processo, Z, lavaggio o sicurezza.

9. **Quali conflitti hardware hai trovato?**

   Il progetto cartaceo cita CPU 1215C, mentre la foto mostra 1214C. Inoltre `I1.5` ha due attribuzioni in una versione del foglio I/O.

10. **Cosa testeresti prima di rimettere in servizio la macchina?**

    Configurazione TIA, continuità e livelli elettrici, mappa I/O, sensori, homing, direzioni a velocità ridotta, arresti, timeout, limiti e funzioni di sicurezza; poi calibrazione e prove ripetute con log.

## Descrizione del contributo — risposta di circa un minuto

Il mio contributo non riguarda la progettazione originaria della macchina. Ho lavorato sul recupero e sull’analisi ingegneristica del materiale esistente: ho inventariato e confrontato le versioni TIA Portal, ricostruito il flusso tra HMI, VBScript, CSV e PLC, e documentato la mappa I/O e la logica di movimento con le incertezze emerse. Ho poi organizzato script MATLAB separati dal controllo reale per analizzare traiettorie, tempi cinematici e ordinamento dei punti. Il lavoro storico su PLC, HMI e interfaccia elettrica era condiviso tra più studenti; quando l’autore di una parte non è dimostrabile non me la attribuisco. Le proposte di validazione, sicurezza e ottimizzazione sono presentate come sviluppi successivi, non come funzioni già installate, e non dichiaro precisioni o prestazioni senza misure.
