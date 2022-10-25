// By MOON
      MOV R0, #.white
      MOV R1, #.red
flash:
      BL delay
      STR R1, .Pixel335
      BL delay
      STR R0, .Pixel335
      B flash
      HALT
delay:
      PUSH {R4, R5, R6}
      LDR R6, .Time
loop:
      LDR R4, .Time
      SUB R5, R4, R6
      CMP R5, #1
      BLT loop
      POP {R4, R5, R6}
      RET
