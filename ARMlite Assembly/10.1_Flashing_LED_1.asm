// By MOON
      MOV R0, #.white
      MOV R1, #.red
flashon:
      STR R0, .Pixel335
      LDR R3, .Time
ondelay:
      LDR R4, .Time
      SUB R5, R4, R3
      CMP R5, #1
      BLT ondelay
      STR R1, .Pixel335
      LDR R3, .Time
offdelay:
      LDR R4, .Time
      SUB R5,R4,R3
      CMP R5, #1
      BLT offdelay
      B flashon
      HALT
