   5 LET r=10: LET c=0
  10 LET xc=15: LET yc=10
  20 LET x=0: LET y=r
  30 LET d=3-2*r
  40 GO SUB 300
  50 LET x=x+1
  60 IF d>0 THEN LET y=y-1: LET d=d+4*(x-y)+10
  70 IF d<=0 THEN LET d=d+4*x+6
  80 GO SUB 300
  90 IF y>=x THEN GO TO 50
  95 IF r>4 THEN LET r=r-1: LET c=c+1: GO TO 10
 100 STOP
 300 PRINT INK c;AT yc+y,xc+x;CHR$ 143
 310 PRINT INK c;AT yc+y,xc-x;CHR$ 143
 320 PRINT INK c;AT yc-y,xc+x;CHR$ 143
 330 PRINT INK c;AT yc-y,xc-x;CHR$ 143
 340 PRINT INK c;AT yc+x,xc+y;CHR$ 143
 350 PRINT INK c;AT yc+x,xc-y;CHR$ 143
 360 PRINT INK c;AT yc-x,xc+y;CHR$ 143
 370 PRINT INK c;AT yc-x,xc-y;CHR$ 143
 380 RETURN
