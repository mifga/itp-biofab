;basic config for duet-driven 1-syringe printer using Allstruder

; PanelDue support
M575 P1 S1 B57600

; General
M550 P"EnderBio" ; set hostname

; Network
M551 P"3v2Allstruder" ; set machine password
M552 S2 ; configure WiFi adapter - access point mode
M586 P0 S1 ; configure HTTP

; Smart Drivers 
;;;;;;; don't focus on this unless you want to tune the 2209's
M569 P0.0 S0 D3; driver 0.0 goes forwards (X axis)
M915 P0.0 S-10 F0 H400 R2
M569 P0.1 S0 D3; driver 0.1 goes forwards (Y axis)
M915 P0.1 S0 F0 H400 R2
M569 P0.2 S1 D3; driver 0.2 goes forwards (Z axis)
M915 P0.2 S-10 F0 H400 R2  
M569 P0.3 S0 D2 F2 Y0:2; driver 0.3 goes forwards (E0 axis)
M915 P0.3 S-25 F0 H400 R0
M569 P0.4 S0 D2 F2 Y0:2; driver 0.4 goes forwards (E1 axis)
M915 P0.4 S-25 F0 H400 R0

; Motor Idle Current Reduction
;;;;;;; you can ignore this - it's a QoL improvement
M906 I10 ; set motor current idle factor
M84 S5 ; set motor current idle timeout

; Axes
;;;;;;; double check your steps/mm
M584 X0.0 Y0.1 Z0.2 ; set axis mapping
M350 X16 Y16 Z16 I1 ; configure microstepping with interpolation
M906 X600 Y700 Z600 ; set axis driver currents
M92 X80 Y80 Z400 ; configure steps per mm
M208 X0:200 Y0:200 Z0:200 ; set minimum and maximum axis limits
M566 X480 Y480 Z12 ; set maximum instantaneous speed changes (mm/min)
M203 X19200 Y19200 Z1800 ; set maximum speeds (mm/min)
M201 X3000 Y3000 Z480 ; set accelerations (mm/s^2)

; Extruders
;;;;;; double check your steps/mm
M584 E0.3 ; set extruder mapping
M350 E16 I1 ; configure microstepping with interpolation
M906 E600 ; set extruder driver currents
M92 E800 ; configure steps per mm (depends on leadscrew)
M566 E60 ; set maximum instantaneous speed changes (mm/min)
M203 E600 ; set maximum speeds (mm/min)
M201 E250 ; set accelerations (mm/s^2)

; Kinematics
M669 K0 ; configure Cartesian kinematics

; Probes
;;;;;; no probe is really used, ignore this section
M558 K0 P0 H5 F120 T6000 ; configure manual probe via slot #0
G31 P500 X0 Y0 Z0.7 ; set Z probe trigger value, offset and trigger height

; Endstops
;;;;;; ignore endstops for most syringe printing
M574 X1 S3 ; configure X axis endstop
M574 Y1 S3 ; configure Y axis endstop
M574 Z1 S3 ; configure Z axis endstop

; Tools
;;;;;; can ignore
M563 P0 D0 ; create tool #0