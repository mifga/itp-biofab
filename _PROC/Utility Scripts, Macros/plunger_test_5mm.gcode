;===============================================================
; plunger_test_5mm.gcode
; Plunger 5 mm advance test (AllStruder FRESH syringe extruder)
;
; AllStruder Utility Scripts and Macros Set
; Compatible: Adventurer 3 / Adventurer 5M + Duet 3 Mini 5+
; Firmware:   RepRapFirmware 3.6.x (Standalone / AP mode)
;
; PURPOSE:
;   - Test extruder direction and motion on AllStruder-style syringe drives.
;   - Measure real plunger travel vs commanded 5 mm move.
;   - Use measurement to calibrate M92 E<steps/mm>.
;
; ASSUMPTIONS:
;   - Tool 0 (T0) is the active syringe extruder.
;   - Cold extrusion is allowed for this FRESH configuration
;     (typically set in config.g via: M302 S0).
;   - Machine is in a safe parked state and the plunger cannot crash
;     into the end of the leadscrew travel during a 5 mm move.
;
; Last edited: 2025-12-04-1800
; LOG:
;   - 2025-12-04-1730: assembled from manually scripted sequence.
;   - 2025-12-04-1800: expanded instructions + calibration notes for students.
;===============================================================


;-------------------------------
; TEST SEQUENCE
;-------------------------------
T0                         ; ensure syringe extruder tool is selected
G92 E0                     ; reset extruder position to 0

; Forward test move
G1 E5 F60                  ; advance +5 mm at 1 mm/s (60 mm/min)
G4 P2000                   ; pause 2 s to observe / measure

; Small retract to confirm direction and avoid binding
G1 E-2 F60                 ; retract 2 mm at 1 mm/s
G4 P1000                   ; pause 1 s

M84 E0                     ; idle extruder motor only


;===============================================================
; INSTRUCTIONS FOR USE (LAB NOTE)
;===============================================================
; GOAL:
;   - Verify that:
;       1) The extruder moves in the correct physical direction.
;       2) The commanded 5 mm matches real plunger travel (or measure error).
;
; SETUP:
;   1. REMOVE any loaded biomaterial and plunger from the syringe barrel
;      if there is a risk of making a mess OR ensure the barrel is empty
;      and the plunger can travel freely.
;   2. Use the thumbscrew to position the syringe pusher block roughly
;      in the middle of its travel range (not at either end stop).
;   3. Choose a reference feature to measure from (for example:
;      - top edge of the pusher block, OR
;      - a printed alignment notch on the carriage).
;   4. Place a small piece of tape or make a pencil mark aligned to that
;      feature so you can precisely measure before/after positions.


; RUNNING THE TEST:
;   1. Make sure:
;        - Tool 0 is assigned to the syringe extruder.
;        - Cold extrusion is allowed (FRESH setup):
;          * Check config.g for: M302 S0
;          * Or run manually before tests if needed.
;   2. From Duet Web Control, run this file:
;        - Job → Upload & Start → plunger_test_5mm.gcode
;   3. Watch the pusher block:
;        - During G1 E5, the block should move "forward" (towards the syringe).
;        - During G1 E-2, it should move "backward" (away from the syringe).
;   4. If the directions are reversed:
;        - Exit the test.
;        - Flip the extruder direction in config.g using:
;              M569 P1 S0  or  M569 P1 S1
;          (P# depends on your actual extruder driver assignment.)
;        - Re-run this test after updating config.g and rebooting.


; MEASURING TRAVEL AND CALIBRATING STEPS/MM:
;   1. BEFORE running the file, mark the initial position of the pusher block.
;   2. AFTER the G1 E5 move completes (and before the retract),
;      measure the distance (in mm) between:
;        - the original mark, and
;        - the new position of the same reference feature.
;   3. Call this measured distance: "measured_mm".
;   4. Your commanded distance was 5 mm. If measured_mm ≈ 5 mm, your
;      current M92 E value is accurate enough for class purposes.
;   5. If measured_mm is NOT close to 5 mm, compute a new E-steps:
;        new_E_steps = old_E_steps * (5.0 / measured_mm)
;
;      Example:
;        - old_E_steps = 500 steps/mm
;        - measured_mm = 4.5 mm
;        - new_E_steps = 500 * (5 / 4.5) ≈ 556 steps/mm
;
;   6. Update config.g in the "Microstepping & steps/mm" section, e.g.:
;        M92 X80.00 Y80.00 Z400.00 E556.00
;      Then save, reboot the board, and re-run this test to confirm.


; RECORDING RESULTS:
;   - In your lab notebook or the shared calibration log for this machine,
;     record:
;       * Date
;       * Machine ID (e.g. LaBrutta, GooPyGears, FlavorForge, JellyBot)
;       * Old E steps/mm
;       * Measured travel for +5 mm
;       * New E steps/mm (if changed)
;       * Any unusual behavior (backlash, binding, noisy motion)


;===============================================================
; TROUBLESHOOTING NOTES
;===============================================================
; - If the extruder does not move:
;     * Check that T0 is a valid tool with a mapped extruder drive.
;     * Check that M302 S0 is set somewhere (for FRESH, extrusion
;       is allowed even when heaters are off).
;     * Check M584 mapping in config.g to confirm which driver is E.
;
; - If the extruder stalls, skips, or makes grinding noises:
;     * Reduce the feedrate (F value) and re-test (e.g. F30).
;     * Check M906 E<current> for appropriate motor current.
;     * Confirm there is no mechanical obstruction or overtight guide.
;
; - If you see error messages in the Duet console while running this:
;     * Take a screenshot or copy the console log.
;     * Attach it to the relevant GitHub issue or Discord thread,
;       and tag the teaching staff.
;


;===============================================================
; PLEASE REPORT ISSUES
;===============================================================
; If you encounter ANY unexpected behavior:
;   - Take a photo or short video if safe to do so.
;   - Save/copy the Duet console output.
;   - Report via:
;       * Discord #fresh-lab-support
;       * GitHub issue in the lab configs repo
;   - Include:
;       * Machine ID + date/time
;       * This file name: plunger_test_5mm.gcode
;       * What you expected vs what actually happened.
;
; End of plunger_test_5mm.gcode
;===============================================================
