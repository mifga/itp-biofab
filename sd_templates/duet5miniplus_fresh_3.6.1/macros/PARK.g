; Park position macro
G91
G1 Z10 F600         ; lift to avoid collision
G90
G1 X0 Y200 F3000    ; move to back-left or another safe zone
M291 P"Tool parked" R"Info" S1
