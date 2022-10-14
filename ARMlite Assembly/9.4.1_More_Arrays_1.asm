// By MOON
      MOV R2, #arrayData
      MOV R3, #reversearrayData
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
      SUB R1, R1, #1
      LDR R4, [R2]
      ADD R2, R2, #4
      SUB R3, R3, #4
      STR R4, [R3]
      CMP R1, #0
      BGT loop
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
reversearrayData: 0 
      0 
      0
      0 
      0
      0
      0
      0
      0
      0
