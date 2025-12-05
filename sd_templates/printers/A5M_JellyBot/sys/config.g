;===============================================================
; FlavorForge / Adventurer 5M + Duet 3 Mini 5+ (AllStruder FRESH)
; Config for RepRapFirmware 3.6.x  (CoreXY)
; Last edited: 2025-12-04
; MACHINE_ID: A5M_JB
;
; NOTES:
; - AllStruder 2.0 syringe extruder (20 mL + 0.5" needle for this profile).
; - Manual positioning instead of endstop-based homing.
; - CoreXY XY stage from Adventurer 5M donor chassis.
; - Axis limits below reflect the **FRESH tip-safe envelope**, not bare machine.
;===============================================================

;-------------------------------
; General preferences
;-------------------------------
G90                                 ; Absolute coordinates for XYZ
M83                                 ; Relative distances for extruders
M550 P"JellybotWiFi"                ; Printer name (AP SSID)

;-------------------------------
; Network (Standalone AP mode)
;-------------------------------
M551 P"jellybot370!"                ; Machine password (EDIT as needed)
M552 S2                             ; AP mode
M586 P0 S1                          ; Enable HTTP
M586 P1 S0                          ; Disable FTP
M586 P2 S0                          ; Disable Telnet

;===============================================================
; DRIVES / KINEMATICS
;===============================================================

; Motion system type
M669 K1                             ; CoreXY

; Motor directions (confirmed)
; Physical mapping:
;   Driver 0: Extruder
;   Driver 1: CoreXY motor A (logical X)
;   Driver 2: CoreXY motor B (logical Y)
;   Driver 3: Z
M569 P1 S1                          ; CoreXY motor A
M569 P2 S1                          ; CoreXY motor B
M569 P3 S1                          ; Z motor
M569 P0 S1                          ; Extruder motor

; Logical mapping
M584 X1 Y2 Z3 E0                    ; X→1, Y→2, Z→3, E→0

; Microstepping & steps/mm
M350 X16 Y16 Z16 E16 I1             ; 1/16 microstepping with interpolation

; Steps/mm (provisional for A5M_FRESH):
; - X/Y: currently 100 steps/mm; refine with ruler tests.
; - Z:   currently 500 steps/mm; refine based on measured travel.
; - E:   1625 steps/mm, based on AllStruder calibration.
M92 X100.00 Y100.00 Z500.00 E1625.00

; Motion tuning
M566 X900.00 Y900.00 Z60.00 E120.00          ; Jerk (mm/min)
M203 X6000.00 Y6000.00 Z300.00 E300.00       ; Max speeds (mm/min)
M201 X500.00 Y500.00 Z20.00 E250.00          ; Accelerations (mm/s^2)

; Motor currents
M906 X800 Y800 Z1200 E1000 I30               ; mA, idle 30%

; Idle timeout
M84 S30                                      ; 30s idle


;===============================================================
; AXIS LIMITS & FRESH ENVELOPE
;===============================================================

; Origin convention:
;   - X0 Y0 = front-left corner of usable FRESH workspace.
;   - Z0   = FRESH reference height (e.g. bath surface or known reference).

; PROVISIONAL FRESH-SAFE TIP ENVELOPE (20 mL + 0.5" needle):
;   X: 0–170 mm
;   Y: 0–125 mm
;   Z: 0–75 mm
; REFINE after xyz_motion_test__A5M_FF.gcode and physical checks.

M208 X0   Y0   Z0   S1                    ; Minima
M208 X170 Y125 Z75  S0                    ; Maxima (tip-safe, EDIT after tests)


;===============================================================
; HOMING STRATEGY / MOTION WITHOUT HOMING
;===============================================================

; FRESH mode:
; - Operators manually position the tool.
; - They then use G92-based macros for origin.
; - Allow motion before homing (intentional for FRESH use).

M564 H0 S0                               ; Allow moves without homing

; Endstops disabled in this configuration.
;M574 X1 S1 P"^io0.in"
;M574 Y1 S1 P"^io1.in"
;M574 Z1 S1 P"^io2.in"


;===============================================================
; Z PROBE / MESH (disabled)
;===============================================================

M558 P0 H5 F120 T6000                    ; No probe
; Adjust if you later add a probe; otherwise mesh is unused.
;M557 X10:160 Y10:115 S20                ; Example mesh inside FRESH envelope


;===============================================================
; HEATERS
;===============================================================

M140 H-1                                 ; Disable bed heater


;===============================================================
; FANS
;===============================================================

M950 F0 C"out5" Q500                     ; Fan 0 on out5, 500 Hz PWM
M106 P0 S0 H-1                           ; Fan 0 off, non-thermostatic


;===============================================================
; TOOLS
;===============================================================

; Tool 0: FRESH syringe extruder on E0, using fan 0
M563 P0 D0 F0                            ; Tool 0: extruder drive 0, fan 0
G10  P0 X0 Y0 Z0                         ; Tool 0 axis offsets
G10  P0 R0 S0                            ; Tool 0 temps (none)


;===============================================================
; CUSTOM / STARTUP
;===============================================================

; AP mode enabled above (M552 S2).
; See /macros/ for:
;   RUN_XYZ_TEST__A5M_FF.g
;   RUN_PLUNGER_TEST__A5M_FF.g
;   DEBUG_REPORT__A5M_FF.g

; End of config.g (A5M_JellyBot)
;===============================================================
