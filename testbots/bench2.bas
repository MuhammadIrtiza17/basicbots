10 DIM P(1000)
100 GOSUB 15020
110 GOTO 100


9000 LET LLX = LOCX
9005 LET LLY = LOCY
9010 LET ANTT = ATN2 DY - LLY, DX - LLX
9015 RETURN

9050 LET LX = LOCX
9055 LET LY = LOCY
9060 LET TX = DX - LX
9065 LET TY = DY - LY
9070 LET DTT = SQR (TX*TX) + (TY*TY)
9075 RETURN



9100 LET DX = (RND 700) + 100
9105 LET DY = (RND 700) + 100
9110 RETURN


15020 FOR I=2 TO 1000
15030 LET P[I]=1
15040 NEXT I
15050 LET P[1]=0
15060 FOR Q=2 TO 32
15070 IF P[Q]=0 THEN GOTO 15110
15075 LET QQ = Q * Q
15080 FOR I = QQ TO 1000 STEP Q
15090 LET P[I]=0
15100 NEXT I
15110 NEXT Q
15120 REM PRINT "FERTIG"
15130 REM PAUSE 1000
15140 LET C=0
15150 FOR I=1 TO 1000
15160 IF P[I]=0 THEN GOTO 15240
15170 IF C<8 THEN GOTO 15200
15180 REM PRINT
15190 LET C=0
15200 LET C=C+1
15210 REM IF I<10 THEN PRINT " ";
15220 REM IF I<100 THEN PRINT " ";
15229 REM PRINT I;" ";
15230 CANNON I % 360, 700
15232 LET SY = SCAN I % 360, 10
15240 NEXT I
15242 GOSUB 9100
15245 GOSUB 9000
15246 DRIVE ANTT, 100
15247 GOSUB 9050
15250 IF DTT < 50 THEN DRIVE ANTT, 0
15250 RETURN

