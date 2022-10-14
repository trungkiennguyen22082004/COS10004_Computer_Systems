// By MOON
      .ALIGN 256 
arrayLength: 10
arrayData: 9 
      8 
      7 
      6
      5
      4
      3
      2
      1 
      0
      HALT
loop:
      ADD R1, R1, #4
      ADD R2, R2, #1
      LDR R3, [R1]
      ADD R0, R0, R3
      CMP R2, #10
      BLT loop
      HALT
