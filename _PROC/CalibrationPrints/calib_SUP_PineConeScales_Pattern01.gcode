;===============================================================
; Simplified Pine Cone Test Pattern
; MACHINE: A3/A5M FRESH rigs (Carbomer bath)
; PURPOSE:
;   - Create a ring of "scale" motifs (tiny curved triangles)
;   - Each scale made from 2–4 mm strokes.
;   - Scales arranged around a circle, offset from center.
;   - Height from Z~2 mm to Z~10 mm.
;   - Fits within ~25 mm radius from center (well under 50 mm).
;
; ASSUMPTIONS:
;   - Origin (0,0) front-left.
;   - Center ~ (72.5, 55).
;   - Carbomer bath in place.
;   - M83 relative E.
;===============================================================

G21
G90
M83
T0
G92 E0

;-------------------------------
; Basic parameters
;-------------------------------
; Center position for "pine cone"
; EDIT if your center differs.
;-------------------------------
G1 Z2.0 F600          ; starting height
G1 X72.5 Y55.0 F6000  ; center of pattern

; Prime
G1 E0.5 F600

;------------------------------------------------------------
; We will define 8 "scale groups" around center.
; Each group:
;   - Start at a base point on a circle of radius ~15–20 mm.
;   - Draw 2–3 short strokes that form a curved, leaf-like shape,
;     each stroke slightly higher in Z.
;
; Group angles (approx): 0, 45, 90, 135, 180, 225, 270, 315 degrees.
;------------------------------------------------------------

; Helper idea: each group has:
;   base radius ~18 mm
;   tip radius  ~22 mm
;   Z for strokes: 2.0, 3.0, 4.0, ... etc. gradually rising.

;-------------------------------
; Group 1 (angle ~0°, pointing to +X)
;-------------------------------
; Base
G1 X90.5 Y55.0 Z2.0  E0.3 F600       ; base of scale
G1 X92.5 Y55.5 Z2.5  E0.3            ; mid
G1 X94.0 Y56.0 Z3.0  E0.3            ; tip

; Retrace slightly inward to suggest curved triangle
G1 X92.5 Y55.0 Z3.2  E0.2
G1 X91.0 Y54.7 Z3.4  E0.2

;-------------------------------
; Group 2 (~45°)
;-------------------------------
G1 X85.0 Y67.0 Z3.0  F6000           ; new base
G1 E0.3 F600
G1 X86.5 Y68.0 Z3.5  E0.3
G1 X88.0 Y69.0 Z4.0  E0.3
G1 X86.5 Y67.5 Z4.2  E0.2
G1 X85.5 Y66.5 Z4.4  E0.2

;-------------------------------
; Group 3 (~90°)
;-------------------------------
G1 X72.5 Y73.0 Z4.0 F6000
G1 E0.3 F600
G1 X72.0 Y74.5 Z4.5  E0.3
G1 X71.5 Y76.0 Z5.0  E0.3
G1 X72.5 Y75.0 Z5.2  E0.2
G1 X73.0 Y73.8 Z5.4  E0.2

;-------------------------------
; Group 4 (~135°)
;-------------------------------
G1 X60.0 Y67.0 Z5.0 F6000
G1 E0.3 F600
G1 X58.8 Y68.2 Z5.5  E0.3
G1 X57.7 Y69.5 Z6.0  E0.3
G1 X58.5 Y68.2 Z6.2  E0.2
G1 X59.2 Y67.0 Z6.4  E0.2

;-------------------------------
; Group 5 (~180°)
;-------------------------------
G1 X54.5 Y55.0 Z6.0 F6000
G1 E0.3 F600
G1 X53.0 Y54.5 Z6.5  E0.3
G1 X51.5 Y54.0 Z7.0  E0.3
G1 X52.8 Y54.8 Z7.2  E0.2
G1 X54.0 Y55.5 Z7.4  E0.2

;-------------------------------
; Group 6 (~225°)
;-------------------------------
G1 X60.0 Y43.0 Z7.0 F6000
G1 E0.3 F600
G1 X58.7 Y42.0 Z7.5  E0.3
G1 X57.5 Y41.0 Z8.0  E0.3
G1 X58.5 Y42.0 Z8.2  E0.2
G1 X59.5 Y43.0 Z8.4  E0.2

;-------------------------------
; Group 7 (~270°)
;-------------------------------
G1 X72.5 Y37.0 Z8.0 F6000
G1 E0.3 F600
G1 X72.0 Y35.8 Z8.5  E0.3
G1 X71.5 Y34.5 Z9.0  E0.3
G1 X72.5 Y35.5 Z9.2  E0.2
G1 X73.2 Y36.5 Z9.4  E0.2

;-------------------------------
; Group 8 (~315°)
;-------------------------------
G1 X85.0 Y43.0 Z9.0 F6000
G1 E0.3 F600
G1 X86.2 Y41.8 Z9.5  E0.3
G1 X87.5 Y40.7 Z10.0 E0.3
G1 X86.5 Y41.8 Z10.2 E0.2
G1 X85.8 Y43.0 Z10.4 E0.2

;-------------------------------
; Finish
;-------------------------------
G1 E-0.5 F600       ; slight retract
G1 Z12.0 F600       ; lift out
G1 X10 Y10 F6000    ; park
M84                 ; idle motors

; End of Simplified Pine Cone Test Pattern
;===============================================================
