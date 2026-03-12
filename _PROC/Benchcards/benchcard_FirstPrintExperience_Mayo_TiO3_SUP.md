# FRESH Bioprinting – Quick-Start Bench Card
Adventurer 3 / Adventurer 5M + Duet 3 Mini 5+
For operators learning syringe loading, touch-off, priming, and starting a construct

## 0. What You Will Receive
- Each operator will be handed:
    - 1 mayo-filled syringe (for air testing)
    - 1 pre-loaded 60 mm Carbomer dish (Bingham-plastic support bath)
    - 1 empty 60 mm clear Petri dish (for learning gel loading)
    - Needle (22G or smaller)
    - Paperclip (vacuum break when loading gels - there is one next to mitre block) 
- You will perform both an air test and a gel-supported print test.

## 1. Preparing the Petri Dish (Support Bath Setup)

### A. Loading Carbomer into a 60 mm dish
- If your dish is empty:
    - Cut the tip off a 50 mL conical (mitre box recommended).
    - Use the plunger to push Carbomer smoothly into the dish.
    - Level the gel with one single stroke of a spatula.
    - Let rest 2–5 minutes so the Bingham-plastic gel self-heals.

### B. Secure the dish on the build plate
- Use three small squares of nano tape placed around the dish edge.
- This prevents sliding without deforming the dish.

### 2. Mounting the Syringe in the AllStruder
- Insert syringe body into the clamp.
- Check that the nozzle is vertical and centered over the dish.
- Move the pusher block gently until it just touches the plunger—
no preload force, no compression.
- Wipe the needle tip clean of droplets.

> NOTE: 22G or smaller nozzles are recommended for Carbomer-supported prints.

## 3. Define Your Coordinate Frame (Critical Step)

> NOTE: You must tell the printer where the dish and surface are.

### A. Move to dish center
- A3 machines: center is ~X72.5 Y55
- A5M machines: center is ~X85 Y75 (approx; adjust visually)
- Use arrow keys / jog controls to reach the dish center.

### B. Touch-off the Z surface
- Lower Z slowly until needle first contacts the gel.
- Raise Z 0.5 mm to avoid cutting the surface.
- Set this as your coordinate reference:

    G92 X<your X> Y<your Y> Z0

- Make a note of these coordinates in your notes.
- Z = 0 is now “surface of the support gel.”
- Most prints begin at Z = 1–2 mm.

## 4. Priming & Purging (Ensures Clean Starts)
- Move the needle to an empty area (NOT over the dish), then:

    G1 E2 F60     ; prime ~2 mm
    G1 E-0.5 F60  ; slight retract to prevent drips

- Check:
    - Clean, smooth extrusion
    - No bubbles
    - No spurting or lag
- If flow is inconsistent → prime again.

## 5. Quick Motion Safety Check
- Before printing anything:

    G1 X0 Y0 F3000       ; front-left
    G1 X<maxX> Y<maxY>   ; rear-right (ensure you clear the dish)
    G1 Z2                ; confirm upward Z motion

- If movement is diagonal, noisy, or unexpected → STOP immediately and notify.

## 6. Running Your First Tests
### A. Air Test (Mayo)
- Run one of these (machine-specific name may vary):
    calib_Mayo_Pattern01.gcode
    xyz_motion_test.gcode
- Look for:
- Straight, precise lines
- Even extrusion
- No needle wobble or unwanted arcs

> NOTE: This verifies XY mapping and extruder calibration.

### B. Gel-Supported Test (Carbomer)
- Choose one:
    calib_SUP_PineConeScales_Pattern01.gcode
    calib_SUP_Wavy_SquigglySpiralBowl_Pattern01.gcode
    OR A simple line or arc pattern you create!
- Expect to observe:
    - Lines staying crisp and suspended within gel
    - Gel surface self-healing behind the needle
    - Clean rising structures from Z2 → Z10 mm
- If lines float up or collapse:
    - Gel was recently disturbed → let the dish rest 2–5 minutes and try again.

## 7. After the Print
- Raise the nozzle:

    G1 Z15 F1200

- Park safely:

    G1 X10 Y10

- Remove the dish straight up, avoiding shear.
- Immediately clean syringe and needle with warm water.
- Record in your notes:
    - Needle gauge
    - Ink used
    - Z offset
    - Behavior of Carbomer (stable? soft? diffuse?)
    - Any unexpected movement or errors

## 8. Common Operator Pitfalls (Avoid These!)
- Starting too low → gouges the gel
- Forgetting to prime → first lines fail
- Dish not centered → prints “in the wall” region
- Not waiting for Carbomer to recover → sagging or diffuse lines
- Wrong needle angle → shears gel instead of depositing smoothly
- If Anything Seems Wrong Stop immediately and email mg7786@nyu.edu and report with a tag:
    wall-hit
    bath-hit
    no-extrusion
    erratic (diagonal drift)
    skip-steps
    no-move
- Include the G92 coords you set and what you expected to happen.