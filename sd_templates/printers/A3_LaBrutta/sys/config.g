;===============================================================
; La Brutta / Adventurer 3 + Duet 3 Mini 5+ (AllStruder FRESH)
; Config for RepRapFirmware 3.6.x  (Cartesian)
; Last edited: 2025-12-04
; MACHINE_ID: A3_LB
;
; NOTES:
; - AllStruder FRESH syringe extruder.
; - Manual positioning instead of endstop-based homing.
; - Adventurer 3 donor chassis (Cartesian XYZ).
; - NOTE - This profile assumes a 10 mL syringe + 0.5" luer-lock needle, update after testing.
; - Axis limits reflect the **tip-safe FRESH envelope**, not bare machine.
;===============================================================

;-------------------------------
; General preferences
;-------------------------------
G90                            ; Absolute coordinates for XYZ
M83                            ; Relative distances for extruders
M550 P"LaBruttaWiFi"           ; Printer name (AP SSID / hostname)

;-------------------------------
; Network (Standalone AP mode)
;-------------------------------
M551 P"123456789teneleven"     ; Machine password (EDIT as needed)
M552 S2                        ; Enable WiFi in access point (AP) mode
M586 P0 S1                     ; Enable HTTP (Duet Web Control)
M586 P1 S0                     ; Disable FTP
M586 P2 S0                     ; Disable Telnet

;===============================================================
; DRIVES / KINEMATICS
;===============================================================

; Motion system type
M669 K0                        ; Cartesian kinematics

; Motor directions
; Physical driver mapping (confirmed):
;   Driver 1: Extruder
;   Driver 2: X
;   Driver 3: Y
;   Driver 4: Z
;   Driver 0: unused
M569 P2 S0                     ; X motor (driver 2) - direction OK (flipped from original)
M569 P3 S1                     ; Y motor (driver 3)
M569 P4 S1                     ; Z motor (driver 4)
M569 P1 S1                     ; Extruder motor (driver 1) - E+ should push plunger

; Logical → physical mapping
M584 X2 Y3 Z4 E1               ; X→2, Y→3, Z→4, E→1

; Microstepping & steps/mm
M350 X16 Y16 Z16 E16 I1        ; 1/16 microstepping with interpolation

; Steps/mm:
; - X/Y: Adventurer-style GT2 belt, 20T pulleys → ~80 steps/mm @ 1.8° + 1/16.
; - Z:   T8 lead screw, 8mm lead → ~400 steps/mm.
; - E:   AllStruder leadscrew, calibrated via plunger.
; NOTE: XYZ still provisional until ruler tests are done.
M92 X80.00 Y80.00 Z400.00 E1625.00

; Motion tuning
M566 X480.00 Y480.00 Z12.00 E60.00          ; Jerk (mm/min)
M203 X19200.00 Y19200.00 Z1800.00 E600.00   ; Max speeds (mm/min)
M201 X3000.00 Y3000.00 Z480.00 E250.00      ; Accelerations (mm/s^2)

; Motor currents (mA) and idle factor
M906 X600 Y700 Z600 E600 I10                ; Idle factor 10%

; Idle timeout
M84 S5                                      ; Idle motors after 5 seconds


;===============================================================
; AXIS LIMITS & FRESH ENVELOPE
;===============================================================

; Origin convention:
;   - X0 Y0 = front-left of usable stage.
;   - Z0   = FRESH reference (e.g. bath surface or known reference).

; PROVISIONAL FRESH-SAFE TIP ENVELOPE
; Based on 10 mL syringe + 0.5" needle:
;   X: 0–145 mm
;   Y: 0–110 mm
;   Z: 0–45 mm
; REFINE after xyz_motion_test__A3_GG.gcode and physical checks.

M208 X0   Y0   Z0   S1                     ; Minima
M208 X145 Y110 Z45  S0                     ; Maxima (tip-safe, EDIT after tests)


;===============================================================
; HOMING STRATEGY / MOTION WITHOUT HOMING
;===============================================================

; For FRESH:
; - Operators manually position the carriage.
; - They then use G92-based macros to define origin.
; - We allow motion before homing (deliberately) to avoid forced endstops.

M564 H0 S0                                ; Allow movement without homing

; Endstops (not used in FRESH mode)
;M574 X1 S3
;M574 Y1 S3
;M574 Z1 S3


;===============================================================
; Z PROBE / MESH (currently unused)
;===============================================================

M558 P0 H5 F120 T6000                    ; No Z probe, keep speeds configured
;G31  P500 X0 Y0 Z0.7                    ; Placeholder, not used
;M557 X10:135 Y10:100 S20                ; Example grid inside envelope (optional)


;===============================================================
; HEATERS
;===============================================================

M140 H-1                                 ; Disable bed heater


;===============================================================
; FANS
;===============================================================

M950 F0 C"out5" Q500                     ; Fan 0 on out5, 500 Hz PWM
M106 P0 S0 H-1                           ; Fan 0 off by default, non-thermostatic


;===============================================================
; TOOLS
;===============================================================

; Tool 0: AllStruder FRESH syringe extruder on E1, using fan 0
M563 P0 D0 F0                            ; Tool 0 uses extruder drive 0 (mapped to driver 1), fan 0
G10  P0 X0 Y0 Z0                         ; Tool 0 axis offsets
G10  P0 R0 S0                            ; Tool 0 temps (none)


;===============================================================
; CUSTOM / STARTUP
;===============================================================

; AP mode is enabled above (M552 S2).
; See /macros/ for:
;   RUN_XYZ_TEST__A3_GG.g
;   RUN_PLUNGER_TEST__A3_GG.g
;   DEBUG_REPORT__A3_GG.g

; End of config.g (A3_LaBrutta)
;===============================================================
