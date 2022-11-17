// Author: MOON (Trung Kien Nguyen - sID 104053642)
//------------------------------------
// Stage 1: Game Setup
//
      MOV R0, #t0       // For adding a new line
//  Read and write codebreaker's name (Store in R3)
      MOV R3, #t1
      STR R3, .WriteString
      MOV R3, #cbn
      STR R3, .ReadString
      STR R3, .WriteString
      STR R0, .WriteString
//  Read and write codemaker's name (Store in R2)
      MOV R2, #t2
      STR R2, .WriteString
      MOV R2, #cmn
      STR R2, .ReadString
      STR R2, .WriteString
      STR R0, .WriteString
//  Read and write the number of guesses (Store in R1)
      MOV R1, #t3
      STR R1, .WriteString
      MOV R1, #cbn
      LDR R1, .InputNum
      STR R1, .WriteUnsignedNum
      STR R0, .WriteString
      HALT
// Stop!!
t0:   .ASCIZ "\n"
t1:   .ASCIZ "Codebreaker is "
t2:   .ASCIZ "Codemaker is "
t3:   .ASCIZ "Maximum number of guesses: "
cbn:  .BLOCK 128
cmn:  .BLOCK 128
