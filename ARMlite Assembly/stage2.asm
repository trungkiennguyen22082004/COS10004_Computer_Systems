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
//
// Stage 2: Code entry function
//
      BL getcode
      HALT
// Stop!!
getcode:
      PUSH {R4, R5, R6, R7}
begin:
      MOV R7, #0        // The number of 'color' chars in the code
      MOV R4, #t4
      STR R4, .WriteString
      MOV R4, #code
      STR R4, .ReadString
      MOV R5, #0        // Index variable for the loop
loop1:
      LDRB R6, [R4 + R5]
      ADD R5, R5, #1
      CMP R6, #114      // Compare the char with "r"
      BEQ color
      CMP R6, #103      // Compare the char with "g"
      BEQ color
      CMP R6, #98       // Compare the char with "b"
      BEQ color
      CMP R6, #121      // Compare the char with "y"
      BEQ color
      CMP R6, #112      // Compare the char with "p"
      BEQ color
      CMP R6, #99       // Compare the char with "c"
      BEQ color
next1:
      CMP R6, #0
      BNE loop1
      CMP R5, #5
      BNE begin
      CMP R7, #4        // Compare the number of 'color' chars with 4
      BNE begin
      B stage2done
color:
      ADD R7, R7, #1
      B next1
stage2done: 
      MOV R0, R4        // Return the valid code to R0
      POP {R4, R5, R6, R7}
      RET
t0:   .ASCIZ "\n"
t1:   .ASCIZ "Codebreaker is "
t2:   .ASCIZ "Codemaker is "
t3:   .ASCIZ "Maximum number of guesses: "
cbn:  .BLOCK 128
cmn:  .BLOCK 128
t4:   .ASCIZ "Enter a code: \n"
code: .BLOCK 128
