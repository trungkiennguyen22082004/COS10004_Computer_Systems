// By BLOODMOON        
        
        MOV R0, #15
  loop: STR R0, .WriteUnsignedNum
        MOV R1, #t1
        STR R1, .WriteString
  select: LDR R2, .Random
        AND R2, R2, #3
        CMP R2, #0
        BEQ select
        CMP R2, R0
        BGT select
        BEQ select
 cont: STR R2, .WriteSignedNum
       MOV R1, #t4
       STR R1, .WriteString
       SUB R0, R0, R2
       STR R0, .WriteUnsignedNum
       MOV R1, #t1
       STR R1, .WriteString
       CMP R0, #1
       BEQ computerWins
       MOV R1, #t2
       STR R1, .WriteString
 int:  LDR R2, .InputNum
       CMP R2, #1
       BLT int
       CMP R2, #3
       BGT int
       CMP R2, R0
       BGT int
       SUB R0, R0, R2
       CMP R0, #1
       BEQ playerWins
       B loop
 playerWins: MOV R1,#t3
       STR R1, .WriteString
       B stop
 computerWins: MOV R1,#t5
       STR R1, .WriteString
       B stop
 stop: HALT
 t1:   .ASCIZ "remaining\n"
 t2:   .ASCIZ "How many do you want to remove (1-3)?\n"
 t3:   .ASCIZ "You win!\n"
 t4:   .ASCIZ "taken by computer. "
 t5:   .ASCIZ "Computer wins! \n"
