;===============================================================
; Mayo Platform Test Pattern
; MACHINE: A3/A5M FRESH rigs (air test, no Carbomer)
; PURPOSE:
;   - Outline approximate addressable XY area
;   - Diagonals to test straight-line motion
;   - Concentric circles for dish placement:
;       35 mm, 60 mm, 100 mm diameters
;   - Use minimal extrusion for a clean, thin line
;
; ASSUMPTIONS:
;   - Origin (0,0) at front-left.
;   - Safe XY envelope >= 0..145 (X), 0..110 (Y).
;   - This pattern uses:
;       Rect: X=5..140, Y=5..105
;       Center for circles: X=72.5, Y=55
;   - Z=10 mm above bed (air print).
;   - M83 (relative E) is active.
;
; BEFORE RUNNING:
;   - Load mayo in syringe.
;   - Manually set Z so that Z=0 is roughly bed level,
;     then either:
;       - Run this at Z=10, or
;       - Edit the Z value below (Z10 → Z5, etc.).
;===============================================================

G21                 ; millimeters
G90                 ; absolute XY
M83                 ; relative extrusion distances
T0                  ; select tool 0
G92 E0              ; reset extruder position

;-------------------------------
; Move to safe start position
;-------------------------------
G1 Z10 F900         ; move to 10 mm above bed (adjust if needed)
G1 X5 Y5 F6000      ; move to front-left inner corner (no extrusion)

;------------------------------------------------------------
; 1) Draw axis-aligned rectangle (outer usable area, inset 5mm)
;------------------------------------------------------------

; We’ll extrude very lightly: ~0.02–0.04 mm of filament per mm of travel.
; Tune E values if lines are too thick/thin.

; Bottom edge: (5,5) → (140,5)
G1 E0.5 F1200       ; prime a bit
G1 X140 Y5  E2.0 F1200

; Right edge: (140,5) → (140,105)
G1 X140 Y105 E2.0 F1200

; Top edge: (140,105) → (5,105)
G1 X5   Y105 E2.0 F1200

; Left edge: (5,105) → (5,5)
G1 X5   Y5   E2.0 F1200

; Slight retract
G1 E-0.5 F1200

;------------------------------------------------------------
; 2) Diagonal lines corner-to-corner
;------------------------------------------------------------

; Diagonal 1: (5,5) → (140,105)
G1 X5   Y5   F6000
G1 E0.5 F1200
G1 X140 Y105 E3.0 F1200
G1 E-0.5 F1200

; Diagonal 2: (140,5) → (5,105)
G1 X140 Y5   F6000
G1 E0.5 F1200
G1 X5   Y105 E3.0 F1200
G1 E-0.5 F1200

;------------------------------------------------------------
; 3) Concentric circles centered at (72.5, 55)
;    Diameters: 35 mm, 60 mm, 100 mm
;
;   R1 = 17.5
;   R2 = 30
;   R3 = 50
;
; We’ll use G2/G3 arcs in absolute mode.
; Start each circle at (Xc + R, Yc) and go full 360°.
;------------------------------------------------------------

; Small circle: 35 mm diameter (typical small dish)
; Center: (72.5, 55), radius = 17.5
G1 E0 F1200
G1 X90.0 Y55.0 F6000          ; start at center + R
G1 E0.5 F1200
G2 X90.0 Y55.0 I-17.5 J0.0 E3.0 F1200  ; clockwise full circle
G1 E-0.5 F1200

; Medium circle: 60 mm diameter (your new clear dish)
; Center: (72.5, 55), radius = 30
G1 X102.5 Y55.0 F6000
G1 E0.5 F1200
G2 X102.5 Y55.0 I-30.0 J0.0 E4.0 F1200
G1 E-0.5 F1200

; Large circle: 100 mm diameter (max comfortable region)
; Center: (72.5, 55), radius = 50
G1 X122.5 Y55.0 F6000
G1 E0.5 F1200
G2 X122.5 Y55.0 I-50.0 J0.0 E5.0 F1200
G1 E-0.5 F1200

;------------------------------------------------------------
; Park and finish
;------------------------------------------------------------
G1 X10 Y10 F6000       ; park near front-left
G1 Z20 F900            ; lift up
M84                    ; idle motors

; End of Mayo Platform Test Pattern
;===========================================================
