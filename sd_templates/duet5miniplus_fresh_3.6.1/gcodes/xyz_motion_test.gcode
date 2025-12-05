;===============================================================
; XYZ Motion Test
;
; AllStruder Utility Scripts and Macros Set
; Config for Adventurer 3, Adventurer 5M Series, RepRapFirmware 3.6.x
; Last edited: 2025-12-04-1600
; LOG:
;  - 2025-12-04-1730 - assembled from manually scripted sequence
;===============================================================

; XYZ Motion Test
G90
G1 X0 Y0 Z10 F3000
G4 P500

G1 X20 F3000
G4 P500
G1 X0 F3000
G4 P500

G1 Y20 F3000
G4 P500
G1 Y0 F3000
G4 P500

G1 Z20 F600
G4 P500
G1 Z10 F600
G4 P500

M84            ; disable motors

;===============================================================
; INSTRUCTIONS
;===============================================================
; - Add instructions here

; PLEASE REPORT ANY ISSUES OR ERROR MESSAGES IMMEDIATELY! (Updates can break these scripts.)

; End of XYZ Motion Test
;===============================================================
