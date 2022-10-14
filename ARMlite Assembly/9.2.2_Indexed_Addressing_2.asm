// MOON 
      MOV R1, #.PixelScreen 
      MOV R2, #.red
      MOV R4, #0
loop1:
      MOV R3, #0
loop2: 
      ADD R5, R3, R4
      STR R2, [R1 + R5] 
      ADD R3, R3, #4 
      CMP R3, #80
      BLT loop2
      ADD R4, R4, #256
      CMP R4, #2560
      BLT loop1
      HALT
