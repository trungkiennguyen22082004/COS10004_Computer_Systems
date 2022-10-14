// By MOON
      MOV R2, #arrayData
      MOV R3, #arrayData
      SUB R1, R2, #4
      LDR R1, [R1]
subloop:
      SUB R1, R1, #1
      ADD R3, R3, #4
      CMP R1, #0
      BGT subloop
      MOV R2, #arrayData
      SUB R1, R2, #4
      LDR R1, [R1]
loop:
      SUB R1, R1, #2
      LDR R4, [R2]
      ADD R2, R2, #4
      SUB R3, R3, #4
      LDR R5, [R3]
      STR R4, [R3]
      STR R5, [R2 - 4]
      CMP R1, #0
      BGT loop
      HALT
      .ALIGN 256 
arrayLength: 10
arrayData: 29 
      28
      27
      26
      25
      24
      23
      22
      21 
      20
