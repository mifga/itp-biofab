;===============================================================
; Extruder direction test
;
; AllStruder Utility Scripts and Macros Set
; Config for Adventurer 3, Adventurer 5M Series, RepRapFirmware 3.6.x
; Last edited: 2025-12-04-1600
; LOG:
;  - 2025-12-04-1730 - assembled from manually scripted sequence
;===============================================================

; Extruder direction test
T0
G92 E0

; Small forward extrude
G1 E1 F60
G4 P1500

; Small retract
G1 E-1 F60
G4 P1500

M84 E0

;===============================================================
; INSTRUCTIONS
;===============================================================
; - Plunger moves down during G1 E1 and up during G1 E-1.
; - If reversed → correct with M569 P0 S0/S1.

; PLEASE REPORT ANY ISSUES OR ERROR MESSAGES IMMEDIATELY! (Updates can break these scripts.)

; End of Extruder direction test
;===============================================================
