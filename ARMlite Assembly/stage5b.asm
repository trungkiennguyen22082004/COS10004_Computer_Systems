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
      B stage3
//
// Stage 2: Code entry function
//
getcode:
      PUSH {R4, R5, R6, R7}
begin:
      MOV R7, #0        // The number of 'color' chars
      MOV R4, #t4
      STR R4, .WriteString
      MOV R4, #code
      STR R4, .ReadSecret
      MOV R5, #0        // Index variable for the loop 1
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
      MOV R0, R4        // Return the valid string to R0
      POP {R4, R5, R6, R7}
      RET
//
// Stage 3: Getting the Secret Code
//
stage3:
      STR R2, .WriteString
      MOV R0, #t5 
      STR R0, .WriteString
      BL getcode
//  Store the secret code in the "secretcode" array
      PUSH {R4, R5, R6, R7}
      MOV R4, R0        // Assign the secret code in R4
      MOV R5, #0        // Index variable for the loop 2
      MOV R7, #secretcode // Index variable for the "secretcode" array
loop2:
      LDRB R6, [R4 + R5]
      ADD R5, R5, #1
      STR R6, [R7]      // Store each 'color' char in each element of the array
      ADD R7, R7, #4
      CMP R5, #4
      BLT loop2
      POP {R4, R5, R6, R7}
//
// Stage 4: Query code entry
//
      PUSH {R11, R12}
//  R11 is used to store the number of predictions instead of R1 
//(because it will be used to store the number of cases 2 followingly)
//  R12 is used for storing the value of guessing order
      MOV R11, R1
      MOV R12, #0
loop3:                  // Loop for codebreaker's guessing
      ADD R12, R12, #1
      STR R3, .WriteString
      MOV R0, #t6
      STR R0, .WriteString
      STR R12, .WriteUnsignedNum
      BL getcode
//  Store the query code in the "querycode" array
      PUSH {R4, R5, R6, R7}
      MOV R4, R0        // Assign the query code in R4
      MOV R5, #0        // Index variable for the loop 4
      MOV R7, #querycode // Index variable for the "querycode" array
loop4:
      LDRB R6, [R4 + R5]
      ADD R5, R5, #1
      STR R6, [R7]      // Store each 'color' char in each element of the array
      ADD R7, R7, #4
      CMP R5, #4
      BLT loop4
      POP {R4, R5, R6, R7}
      BL comparecodes
      BL feedback
      CMP R12, R11
      BLT loop3
//
// Stage 5: Query code evaluation
//
//  Step 5a
//
comparecodes:
      PUSH {R3, R4, R5, R6, R7, R8, R9, R10, R11, R12}
      MOV R4, #0        // Index variable for the loop 5
      MOV R5, #0        // Index variable for case 1 (x)
      MOV R6, #0        // Index variable for case 2 (y)
      MOV R7, #secretcode
      MOV R8, #querycode
loop5:
      ADD R4, R4, #1
      LDR R9, [R7]
      LDR R10, [R8]
//  Searching for case 1
      CMP R9, R10
      BEQ case1         // If in case 1, go to next 5, no need to search for case 2
//  Searching for case 2
      MOV R11, #querycode
      MOV R12, #0       // Index variable for the sub-loop 5
subloop5:
      ADD R12, R12, #1
      LDR R3, [R11]
      CMP R9, R3
      BEQ case2         // If in case 2, go to sub-next 5, then return and continue until the last element of query array
subnext5:
      ADD R11, R11, #4
      CMP R12, #4
      BLT subloop5
next5:
      ADD R7, R7, #4
      ADD R8, R8, #4
      CMP R4, #4
      BLT loop5
      B done
case1:
      ADD R5, R5, #1
      B next5
case2:
      ADD R6, R6, #1
      B subnext5
done: 
//  Return the values of the numbers of cases 1 and cases 2
      MOV R0, R5
      MOV R1, R6
      POP {R3, R4, R5, R6, R7, R8, R9, R10, R11, R12}
      RET
//
//  Step 5b
//
feedback:
      PUSH {R4, R5, R6, R7}
      MOV R4, R12       // Argument of the function: current guessing index
      MOV R5, R0        // Argument of the function: the number of cases 1 in the current guess
      MOV R6, R1        // Argument of the function: the number of cases 2 in the current guess
      MOV R7, #t7
      STR R7, .WriteString
      MOV R7, R5
      STR R7, .WriteUnsignedNum
      MOV R7, #t8
      STR R7, .WriteString
      MOV R7, R6
      STR R7, .WriteUnsignedNum
      CMP R5, #4
      BEQ win
      CMP R4, R11
      BEQ lose
      POP {R4, R5, R6, R7}
      RET
win:
      STR R3, .WriteString
      MOV R7, #t9
      STR R7, .WriteString
      POP {R4, R5, R6, R7}
      POP {R11, R12}
      B stop
lose:
      STR R3, .WriteString
      MOV R7, #t10
      STR R7, .WriteString
      POP {R4, R5, R6, R7}
      POP {R11, R12}
      B stop
stop: HALT
// Stop!!
      .ALIGN 256
secretcode:             // Set up the "secretcode array"
      0
      0
      0
      0
querycode:              // Set up the "querycode array"
      0
      0
      0
      0
t0:   .ASCIZ "\n"
t1:   .ASCIZ "Codebreaker is "
t2:   .ASCIZ "Codemaker is "
t3:   .ASCIZ "Maximum number of guesses: "
cbn:  .BLOCK 128
cmn:  .BLOCK 128
t4:   .ASCIZ "\nEnter a code: \n"
code: .BLOCK 128
t5:   .ASCIZ ", please enter a 4-character secret code"
t6:   .ASCIZ ", this is guess number: "
t7:   .ASCIZ "Position matches: "
t8:   .ASCIZ ", Colour matches: "
t9:   .ASCIZ ", you WIN!\nGame Over"
t10:  .ASCIZ ", you LOSE!\nGame Over"
