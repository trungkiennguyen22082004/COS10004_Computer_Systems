// By MOON
      MOV R0, #t1
      STR R0, .WriteString
      LDR R0, .InputNum
      MOV R1, #t2
      STR R1, .WriteString
      LDR R1, .InputNum
flash:
      BL oneseconddelay
      BL reddraw
      BL oneseconddelay
      BL whitedraw
      ADD R3, R3, #1
      CMP R3, R0
      BLT flash
      BL subdelay
      MOV R3, #0
      B flash
      HALT
reddraw:
      PUSH {R4}
      MOV R4, #.red
      STR R4, .Pixel335
      POP {R4}
      RET
whitedraw:
      PUSH {R4}
      MOV R4, #.white
      STR R4, .Pixel335
      POP {R4}
      RET
oneseconddelay:
      PUSH {R4, R5, R6}
      LDR R6, .Time
loopa:
      LDR R4, .Time
      SUB R5, R4, R6
      CMP R5, #1
      BLT loopa
      POP {R4, R5, R6}
      RET
subdelay:
      PUSH {R4, R5, R6}
      LDR R6, .Time
loopb:
      LDR R4, .Time
      SUB R5, R4, R6
      CMP R5, R1
      BLT loopb
      POP {R4, R5, R6}
      RET
t1:   .ASCIZ "Enter the number of rapid 1 second flashes before the pause:\n"
t2:   .ASCIZ "Enter the pause time (in secs) between each set of rapid flashes:\n"
