;===============================================================
; Wavy Squiggly Spiral Bowl
; MACHINE: A3/A5M FRESH rigs (Carbomer bath)
; PURPOSE:
;   - Single continuous extruded line from near center that
;     slowly spirals outward and upward (Z2 → Z10).
;   - XY jitter shows Bingham support + self-healing.
;   - Good for multi-pass multi-color: rotate dish and re-run.
;
; ASSUMPTIONS:
;   - Origin (0,0) front-left.
;   - Center of dish ~= (72.5, 55).
;   - Bath base reference ~ Z0.
;   - Start at Z2 mm, end near Z10 mm.
;   - Relative extrusion M83.
;===============================================================

G21                 ; mm
G90                 ; absolute XY
M83                 ; relative E
T0                  ; tool 0
G92 E0

;-------------------------------
; Move to center and safe Z
;-------------------------------
G1 Z2.0 F600        ; start 2 mm above reference base
G1 X72.5 Y55.0 F6000

; Prime a tiny amount
G1 E0.5 F600

;------------------------------------------------------------
; Spiral path:
; - Incrementally increase radius and Z.
; - Inject small X/Y jitter to make it "squiggly".
; NOTE:
; - E values tuned for a 22G-ish nozzle and Carbomer;
;   adjust E if lines are too thick/thin.
;------------------------------------------------------------

; We'll step outwards in ~1 mm radial increments, 0.5 mm Z increments.
; Roughly 16–18 waypoints → 8–9 mm height gain.

; Segment 1
G1 X73.5 Y55.2 Z2.5  E0.4 F600
G1 X74.0 Y54.5 Z2.7  E0.4

; Segment 2
G1 X75.0 Y55.8 Z3.0  E0.4
G1 X75.8 Y56.0 Z3.3  E0.4

; Segment 3
G1 X76.5 Y57.0 Z3.6  E0.4
G1 X76.0 Y58.0 Z3.9  E0.4

; Segment 4
G1 X75.0 Y58.5 Z4.2  E0.4
G1 X74.0 Y58.0 Z4.5  E0.4

; Segment 5
G1 X73.0 Y57.5 Z4.8  E0.4
G1 X72.0 Y57.0 Z5.1  E0.4

; Segment 6
G1 X71.5 Y56.0 Z5.4  E0.4
G1 X71.8 Y55.0 Z5.7  E0.4

; Segment 7
G1 X72.5 Y54.0 Z6.0  E0.4
G1 X73.5 Y53.5 Z6.3  E0.4

; Segment 8
G1 X74.8 Y53.8 Z6.6  E0.4
G1 X76.0 Y54.5 Z6.9  E0.4

; Segment 9
G1 X77.0 Y55.5 Z7.2  E0.4
G1 X77.5 Y56.8 Z7.5  E0.4

; Segment 10
G1 X77.2 Y58.0 Z7.8  E0.4
G1 X76.0 Y59.0 Z8.1  E0.4

; Segment 11
G1 X74.5 Y59.5 Z8.4  E0.4
G1 X73.0 Y59.0 Z8.7  E0.4

; Segment 12
G1 X72.0 Y58.0 Z9.0  E0.4
G1 X71.3 Y56.8 Z9.3  E0.4

; Segment 13
G1 X71.0 Y55.5 Z9.6  E0.4
G1 X71.5 Y54.3 Z9.9  E0.4

; Finish point
G1 X72.5 Y54.0 Z10.0 E0.4

;-------------------------------
; Wrap up
;-------------------------------
G1 E-0.5 F600        ; slight retract
G1 Z12.0 F600        ; lift out of bath
G1 X10 Y10 F6000     ; park near front-left
M84                  ; idle motors

; End of Wavy Squiggly Spiral Bowl
;===============================================================
