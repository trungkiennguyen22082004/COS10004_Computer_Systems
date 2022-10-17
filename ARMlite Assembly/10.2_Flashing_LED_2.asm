// By MOON
      MOV R0, #.white
      MOV R1, #.red
flashon:
      STR R1, .Pixel335
      LDR R3, .Time
ondelay:
      LDR R4, .Time
      SUB R5, R4, R3
      CMP R5, #1
      BLT ondelay
      STR R0, .Pixel335
      LDR R3, .Time
      ADD R2, R2, #1
      CMP R2, #3
      BEQ delay
offdelay:
      LDR R4, .Time
      SUB R5,R4,R3
      CMP R5, #1
      BLT offdelay
      B flashon
delay:
      LDR R4, .Time
      SUB R5,R4,R3
      CMP R5, #2
      BLT delay
      LDR R3, .Time
      MOV R2, #0
      B offdelay
      HALT
