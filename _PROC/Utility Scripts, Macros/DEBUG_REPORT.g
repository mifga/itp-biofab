; Debug Report Macro
M122       ; full diagnostics
M98 P"config.g"   ; show errors in config
M115       ; firmware version
M408 S0    ; object model snapshot
M584       ; drive mapping
M569 P0:1:2:3     ; motor direction summary
M906       ; motor currents
M203       ; max speeds
M566       ; jerk settings
M208       ; axis limits
M291 P"Debug report completed in console." S1
