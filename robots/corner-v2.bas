1 REM corner-runner.bas
2 REM move to a corner and scan and shoot

10 LET SPEEDHIGH = 100
11 LET SPEEDMID = 50
12 LET SPEEDLOW = 10
13 LET SPEEDSTOP = 0
14 LET DAM = 0


100 LET Q = RND 4
105 IF Q = 0 THEN GOTO 200
110 IF Q = 1 THEN GOTO 220
115 IF Q = 2 THEN GOTO 240
120 IF Q = 3 THEN GOTO 260
130 GOTO 240

200 LET DX = 100
205 LET DY = 100
206 LET TS = 0
207 LET BS = 90
210 GOTO 400

220 LET DX = 900
225 LET DY = 100
226 LET TS = 90
227 LET BS = 180
230 GOTO 400

240 LET DX = 900
245 LET DY = 900
246 LET TS = 180
247 LET BS = 270
250 GOTO 400

260 LET DX = 100
265 LET DY = 900
266 LET TS = 270
267 LET BS = 360
270 GOTO 400


400 GOSUB 2000
420 DRIVE A, SPEEDSTOP
430 LET DAM = DAMAGE
440 GOSUB 3000
450 GOTO 100




2000 REM drive to around DX,DY
2003 GOSUB 2110 : REM get angle to target
2004 LET AA = A
2005 DRIVE AA,SPEEDHIGH
2006 GOSUB 5000 : REM get distance to target
2010 IF D < 50 THEN GOTO 2030
2015 IF D < 100 THEN GOTO 2040
2020 IF D >= 100 THEN GOTO 2005
2030 DRIVE AA,SPEEDSTOP
2035 RETURN
2040 DRIVE AA, SPEEDMID
2045 GOTO 2006


2100 REM get angle to target
2110 LET LX = LOCX
2115 LET LY = LOCY
2120 LET A = ATN2 DY-LY, DX-LX
2125 RETURN

3000 REM scan and shoot 
3001 REM from TS to BS
3010 LET SCANANGLE = TS
3015 IF DAM <> DAMAGE THEN RETURN
3020 LET RANGE = SCAN SCANANGLE, 5
3025 IF RANGE < 700 AND RANGE > 40 THEN GOTO 3050
3030 LET SCANANGLE = SCANANGLE + 5
3035 IF SCANANGLE >= BS THEN RETURN
3040 GOTO 3015
3050 LET DIST = SCAN SCANANGLE,5
3060 CANNON SCANANGLE, DIST
3070 GOTO 3015

5000 REM calculate distance 
5001 REM DX,DY is the destination
5002 REM D is the distance
5005 LET LX = LOCX
5010 LET LY = LOCY
5015 LET TX = DX-LX
5020 LET TY = DY-LY
5025 LET D = SQR (TX*TX)+(TY*TY)
5030 RETURN