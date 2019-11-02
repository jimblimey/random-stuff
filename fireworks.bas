REM Based on code from https://www.101computing.net/fireworks-display/
REM Compile using ZXBASIC (http://www.zxbasic.net): zxb -Bat fireworks.bas
BORDER 0: BRIGHT 1: PAPER 0: INK 7: CLS
RANDOMIZE
REM Number of particles
CONST par AS UBYTE=30
REM Offset from left of screen
CONST offset AS UBYTE=128
REM Array containing x,y positions
DIM pos(par,2) AS FLOAT
REM Array containing velocities
DIM v(par,2) AS FLOAT
REM Array containint lifespan of particles
DIM ls(par) AS INTEGER
REM Operational stuff
DIM i AS INTEGER
DIM c,cc AS UBYTE
REM Init
FOR i=1 TO par
    LET pos(i,0) = 0
    LET pos(i,1) = 0
    REM Setup initial particle velocities
    IF i < (par/2) THEN
       LET v(i,0) = RND *2 - RND *2
       LET v(i,1) = RND *10 - RND *10
    ELSE
       LET v(i,0) = 0
       LET v(i,1) = 0
    END IF
    REM Setup initial lifespans
    ls(i) = RND *40
NEXT i
10 REM Draw
FOR i=1 TO par
    REM Pick a colour based on the current value of i
    LET c=i MOD 5
    IF c=0 THEN LET cc=7: END IF
    IF c=1 THEN LET cc=6: END IF
    IF c=2 THEN LET cc=3: END IF
    IF c=3 THEN LET cc=4: END IF
    IF c=4 THEN LET cc=5: END IF
    REM Plop out a black pixel
    PLOT OVER 1; INK 0; offset + pos(i,0), pos(i, 1)
    REM Move the particle
    LET pos(i,0) = pos(i,0) + v(i,0)
    LET pos(i,1) = pos(i,1) + v(i,1)
    REM Apply gravity and reduce lifespan
    LET v(i,1) = v(i,1)+1.2
    LET ls(i) = ls(i)-1
    REM Particle is dead, reset it
    IF ls(i) < 0 OR pos(i,1) > 100 OR pos(i,1) < 0 OR pos(i,0) > 50 OR pos(i,0) < -50 THEN
       LET pos(i,0) = 0
       LET pos(i,1) = 0
       LET ls(i) = RND *40
       LET v(i,0) = RND *2 - RND *2
       LET v(i,1) = RND *10 - RND *10
    END IF
    REM Plot particle
    PLOT INK cc; offset + pos(i,0), pos(i,1)
NEXT i
REM If you happen to catch the loop in the right place you can press q to quit!
IF INKEY$ = "q" THEN STOP:END IF
GOTO 10
