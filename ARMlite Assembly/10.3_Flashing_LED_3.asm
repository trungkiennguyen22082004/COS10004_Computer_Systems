// By MOON
      MOV R0, #.white
      MOV R1, #.red
      PUSH {R3, R4}
      MOV R3, #t1
      STR R3, .WriteString
      LDR R6, .InputNum
      MOV R4, #t2
      STR R4, .WriteString
      LDR R7, .InputNum
      POP {R3, R4}
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
      CMP R2, R6
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
      CMP R5, R7
      BLT delay
      LDR R3, .Time
      MOV R2, #0
      B offdelay
      HALT
t1:   .ASCIZ "Enter the number of rapid 1 second flashes before the pause:\n"
t2:   .ASCIZ "Enter the pause time (in secs) between each set of rapid flashes:\n"
