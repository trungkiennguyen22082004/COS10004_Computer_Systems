// MOON 
      MOV R1, #.PixelScreen 
      MOV R2, #.red
      MOV R3, #0
loop: 
      STR R2, [R1 + R3] 
      ADD R3, R3, #4 
      CMP R3, #80
      BLT loop
      HALT
