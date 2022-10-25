// By MOON
      MOV R0, #.white
      MOV R1, #.red
flash:
      BL oneseconddelay
      STR R1, .Pixel335
      BL oneseconddelay
      STR R0, .Pixel335
      ADD R3, R3, #1
      CMP R3, #3
      BLT flash
      BL twosecondsdelay
      MOV R3, #0
      B flash
      HALT
oneseconddelay:
      PUSH {R4, R5, R6}
      LDR R6, .Time
loop1:
      LDR R4, .Time
      SUB R5, R4, R6
      CMP R5, #1
      BLT loop1
      POP {R4, R5, R6}
      RET
twosecondsdelay:
      PUSH {R4, R5, R6}
      LDR R6, .Time
loop3:
      LDR R4, .Time
      SUB R5, R4, R6
      CMP R5, #2
      BLT loop3
      POP {R4, R5, R6}
      RET
