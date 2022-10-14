// By MOON
      MOV R1, #.PixelScreen 
      MOV R2, #.blue
      MOV R5, #.green
      MOV R3, #256
      MOV R6, #128
loop1: 
      ADD R4, R1, R3
      STR R2, [R4] 
      ADD R3, R3, #4 
      CMP R3, #336
      BLT loop1
loop2:
      ADD R7, R1, R6
      STR R5, [R7]
      ADD R6, R6, # 256
      CMP R6, #5248
      BLT loop2
      HALT
