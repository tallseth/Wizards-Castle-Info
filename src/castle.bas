REM https://gstein.svn.beanstalkapp.com/oss/trunk/wizcastle/wiz.bas

10 REM"_(C2SLFF4
20 CLEAR60:DIMC$(34),I$(34),R$(4),W$(8),E$(8)
30 DIMC(3,4),T(8),O(3),R(3):PRINTCHR$(12);"Creating Arrays"
40 POKE260,218:POKE261,1:T=USR(0):T=PEEK(-2049)
50 DEFFND(Q)=Q*64+X*8+Y-585:DEFFNE(Q)=Q+100*(Q>99)
60 Y$=CHR$(13)+"** ANSWER YES OR NO "+CHR$(13)
70 DEFFNA(Q)=1+INT(RND(8)*Q):DEFFNB(Q)=Q+8*((Q=9)-(Q=0))
80 Q=RND(-(2*T+1)):RESTORE:FORQ=1TO34:READC$(Q),I$(Q):NEXTQ
90 FORQ=-512TO0:POKEQ,101:NEXTQ:FORQ=1TO8:READW$(Q),E$(Q):NEXTQ
100 FORQ=1TO4:READR$(Q):NEXTQ:DEFFNC(Q)=-Q*(Q<19)-18*(Q>18)
110 PRINTCHR$(12):GOSUB3270:PRINTTAB(21)"THE WIZARD'S CASTLE":PRINT:GOSUB3270
120 PRINT"Copyright (C) 1980 by Joseph R Power":PRINT
130 PRINT"Last Revised - 04/12/80  11:10 PM":PRINT
140 PRINT:PRINT"PLEASE BE PATIENT - ";:X=1:Y=4
150 POKEFND(1),2:PRINT"IN";:FORZ=1TO7:FORQ1=1TO2:Q=104:GOSUB3200
160 POKEFND(Z+1),103:NEXTQ1:NEXTZ:PRINT"I";
170 FORZ=1TO8:FORQ=113TO124:GOSUB3200:NEXTQ:FORQ1=1TO3
180 FORQ=105TO112:GOSUB3200:NEXTQ:Q=125:GOSUB3200:NEXTQ1:READO$:PRINTO$;:NEXTZ
190 FORQ=126TO133:Z=FNA(8):GOSUB3200:NEXTQ:PRINT"G";
200 Q=101:FORA=1TO3:Z=FNA(8):GOSUB3200:C(A,1)=X:C(A,2)=Y:C(A,3)=Z:C(A,4)=0
210 READO$:PRINTO$;:NEXTA:PRINT"S";:RC=0:ST=2:DX=14:R$(3)="MAN"
220 Q=112+FNA(12):Z=FNA(8):GOSUB3200:R(1)=X:R(2)=Y:R(3)=Z
230 Q=109:Z=FNA(8):GOSUB3200:O(1)=X:O(2)=Y:O(3)=Z:PRINT"TLE
240 BF=0:OT=8:AV=0:HT=0:T=1:VF=0:LF=0:TC=0:GP=60:RF=0:OF=0:BL=0
250 IQ=8:SX=0:FORQ=1TO8:T(Q)=0:NEXTQ:PRINTCHR$(12);"ALL RIGHT, BOLD ONE"
260 PRINT:PRINT"YOU MAY BE AN ELF, DWARF, MAN, OR HOBBIT":GOSUB3280
270 FORQ=1TO4:IFLEFT$(R$(Q),1)=O$THENRC=Q:ST=ST+2*Q:DX=DX-2*Q
280 NEXTQ:PRINT:OT=OT+4*(RC=1):IFRC>0THENR$(3)="HUMAN":GOTO300
290 PRINT"** THAT WAS INCORRECT. PLEASE TYPE E, D, M, OR H.":GOTO260
300 PRINT:PRINT"SEX ";:GOSUB3290:IFO$="M"THENSX=1:GOTO320
310 IFO$<>"F"THENPRINT:PRINT"** CUTE ";R$(RC);", REAL CUTE. TRY M OR F":GOTO300
320 PRINTCHR$(12):PRINT"OK ";R$(RC);", YOU HAVE THESE STATISTICS:":PRINT
330 PRINT"STRENGTH= ";ST;" INTELLIGENCE= ";IQ;" DEXTERITY= ";DX:PRINT
340 PRINT"AND ";OT;" OTHER POINTS TO ALLOCATE AS YOU WISH.":PRINT
350 Z$="INTELLIGENCE ":GOSUB3300:IQ=IQ+Q:IFOT=0THEN370
360 Z$="STRENGTH ":GOSUB3300:ST=ST+Q:IFOTTHENZ$="DEXTERITY ":GOSUB 3300:DX=DX+Q
370 PRINTCHR$(12):PRINT"OK, ";R$(RC);", YOU HAVE 60 GOLD PIECES (GP's)":PRINT
380 Z$="ARMOR":GOSUB3390:AV=0:WV=0:FL=0:WC=0
390 PRINT"PLATE<30> CHAINMAIL<20> LEATHER<10> NOTHING<0>"
400 GOSUB3280:IFO$="N"THEN440
410 AV=-3*(O$="P")-2*(O$="C")-(O$="L"):IFAV>0THEN440
420 PRINT:PRINT"** ARE YOU A ";R$(RC);" OR ";C$(FNA(12)+12);
430 PRINT" ? TYPE P,C,L, OR N":PRINT:GOTO380
440 AH=AV*7:GP=GP-AV*10:PRINTCHR$(12)
450 PRINT:PRINT"OK, BOLD ";R$(RC);", YOU HAVE ";GP;" GP's LEFT":PRINT
460 Z$="WEAPONS":GOSUB3390
470 PRINT"SWORD<30> MACE<20> DAGGER<10> NOTHING<0>":GOSUB3280:IFO$="N"THEN500
480 WV=-3*(O$="S")-2*(O$="M")-(O$="D"):IFWV>0THEN500
490 PRINT:PRINT"** IS YOUR IQ REALLY ";IQ;"? TYPE S, M, D, OR N":PRINT:GOTO460
500 GP=GP-WV*10:PRINTCHR$(12):IFGP<20THEN540
510 PRINT"WANT TO BUY A LAMP FOR 20 GP's ";:GOSUB3290
520 IFO$="Y"THENLF=1:GP=GP-20:GOTO540
530 IFO$<>"N"THENPRINT:PRINTY$:PRINT:GOTO510
540 PRINTCHR$(12):IFGP<1THENQ=0:GOTO600
550 PRINT:PRINT"OK, ";R$(RC);", YOU HAVE ";GP;" GOLD PIECES LEFT":PRINT
560 INPUT"FLARES COST 1 GP EACH, HOW MANY DO YOU WANT ";O$
570 Q=VAL(O$):PRINT:IFQ>0ORASC(O$)=48THEN590
580 PRINT"** IF YOU DON'T WANT ANY JUST TYPE 0 (ZERO)":PRINT:GOTO560
590 IFQ>GPTHENPRINT"** YOU CAN ONLY AFFORD ";GP:PRINT:GOTO560
600 FL=FL+Q:GP=GP-Q:PRINTCHR$(12):X=1:Y=4:Z=1
610 PRINT"OK ";R$(RC);", YOU ENTER THE CASTLE AND BEGIN.":PRINT:GOTO1670
620 T=T+1:IFRF+OF>0THEN690
630 IFC(1,4)>T(1)THENT=T+1
640 IFC(2,4)>T(3)THENGP=GP-FNA(5):IFGP<0THENGP=0
650 IFC(3,4)<=T(5)THEN690
660 A=X:B=Y:C=Z:X=FNA(8):Y=FNA(8):Z=FNA(8)
670 POKEFND(Z),FNE(PEEK(FND(Z)))+100:X=A:Y=B:Z=C
680 IFPEEK(FND(Z))=1THENFORQ=1TO3:C(Q,4)=-(C(Q,1)=X)*(C(Q,2)=Y)*(C(Q,3)=Z):NEXT
690 IFFNA(5)>1THEN 790
700 PRINT:PRINT"YOU ";:Q=FNA(7)+BL:IFQ>7THENQ=4
710 ONQGOSUB750,730,740,720,760,770,780:GOTO790
720 PRINT"STEPPED ON A FROG":RETURN
730 PRINT"HEAR ";MID$("A SCREAM FOOTSTEPSA WUMPUS  THUNDER",FNA(4)*9-8,9):RETURN
740 PRINT"SNEEZED":RETURN
750 PRINT"SEE A BAT FLY BY":RETURN
760 PRINT"SMELL ";C$(12+FNA(13));" FRYING":RETURN
770 PRINT"FEEL LIKE YOU'RE BEING WATCHED":RETURN
780 PRINT"ARE PLAYING WIZARD'S CASTLE":RETURN
790 IFBL+T(4)=2THENPRINT:PRINTC$(29);" CURES YOUR BLINDNESS":BL=0
800 IFBF+T(6)=2THENPRINT:PRINTC$(31);" DISSOLVES THE BOOK":BF=0
810 PRINT:PRINT:PRINT:INPUT"YOUR MOVE ";O$:IFLEFT$(O$,2)="DR"THEN1180
820 O$=LEFT$(O$,1):IFO$="N"THEN 940
830 IF(O$="S")OR(O$="W")OR(O$="E")THEN 950
840 IFO$="U"THEN 970
850 IFO$="D"THEN 990
860 IFO$="M"THEN1010
870 IFO$="F"THENON1+BLGOTO1070,1010
880 IFO$="L"THENON1+BLGOTO1110,1010
890 IFO$="O"THEN1310
900 IFO$="G"THENON1+BLGOTO1480,1010
910 IFO$="T"THENPRINT:ON1+RFGOTO1590,1600
920 IFO$="Q"THEN1640
930 PRINT:PRINT"** STUPID ";R$(RC);" THAT WASN'T A VALID COMMAND":GOTO620
940 IFPEEK(FND(Z))=2THEN2900
950 X=X+(O$="N")-(O$="S"):Y=Y+(O$="W")-(O$="E")
960 X=FNB(X):Y=FNB(Y):GOTO1670
970 IFPEEK(FND(Z))=3THENZ=Z-1:GOTO1670
980 Z$="UP":GOTO1000
990 Z$="DOWN":IFPEEK(FND(Z))=4THENZ=Z+1:GOTO1670
1000 PRINT:PRINT"** OH ";R$(RC);", NO STAIRS GOING ";Z$;" IN HERE":GOTO620
1010 IFBL=1THENPRINT:PRINT"** YOU CAN'T SEE ANYTHING, DUMB ";R$(RC):GOTO620
1020 PRINT:PRINT:A=X:B=Y:FORX=1TO8:FORY=1TO8:Q=PEEK(FND(Z)):IFQ>99THENQ=34
1030 IFX=AANDY=BTHENPRINT"<";I$(Q);">";:GOTO1050
1040 PRINT" ";I$(Q);" ";
1050 NEXTY:PRINT:PRINT:NEXTX:X=A:Y=B:GOTO1100
1060 PRINT") LEVEL ";Z:GOTO620
1070 IFFL=0THENPRINT:PRINT"** HEY BRIGHT ONE, YOU'RE OUT OF FLARES":GOTO620
1080 PRINT:PRINT:FL=FL-1:A=X:B=Y:FORQ1=A-1TOA+1:X=FNB(Q1):FORQ2=B-1TOB+1:Y=FNB(Q2)
1090 Q=FNE(PEEK(FND(Z))):POKEFND(Z),Q:PRINTI$(Q);"  ";:NEXTQ2:PRINT:PRINT:NEXTQ1:X=A:Y=B
1100 GOSUB 3400:GOTO620
1110 IFLF=0THENPRINT:PRINT"** YOU DON'T HAVE A LAMP, ";R$(RC):GOTO620
1120 PRINT:PRINT"WHERE DO YOU SHINE THE LAMP (N,S,E, OR W) ";:GOSUB3290
1130 A=X:B=Y:X=FNB(X+(O$="N")-(O$="S")):Y=FNB(Y+(O$="W")-(O$="E"))
1140 IFA-X+B-Y=0THENPRINT:PRINT"** TURKEY! THAT'S NOT A DIRECTION":GOTO620
1150 PRINT:PRINT"THE LAMP SHINES INTO (";X;",";Y;") LEVEL ";Z:PRINT
1160 POKEFND(Z),FNE(PEEK(FND(Z))):PRINT"THERE YOU WILL FIND ";C$(PEEK(FND(Z)))
1170 X=A:Y=B:GOTO620
1180 IFPEEK(FND(Z))<>5THENPRINT:PRINT"** IF YOU WANT A DRINK, FIND A POOL":GOTO620
1190 Q=FNA(8):PRINT:PRINT"YOU TAKE A DRINK AND ";:IFQ<7THENPRINT"FEEL ";
1200 ONQGOTO1210,1220,1230,1240,1250,1260,1270,1290
1210 ST=FNC(ST+FNA(3)):PRINT"STRONGER":GOTO620
1220 ST=ST-FNA(3):PRINT"WEAKER":ON1-(ST<1)GOTO620,2840
1230 IQ=FNC(IQ+FNA(3)):PRINT"SMARTER":GOTO620
1240 IQ=IQ-FNA(3):PRINT"DUMBER":ON1-(IQ<1)GOTO620,2840
1250 DX=FNC(DX+FNA(3)):PRINT"NIMBLER":GOTO620
1260 DX=DX-FNA(3):PRINT"CLUMSIER":ON1-(DX<1)GOTO620,2840
1270 Q=FNA(4):IFQ=RCTHEN1270
1280 RC=Q:PRINT"BECOME A ";R$(RC):GOTO620
1290 SX=1-SX:PRINT"TURN INTO A ";:IFSX=0THENPRINT"FE";
1300 PRINT"MALE ";R$(RC):GOTO620
1310 IFPEEK(FND(Z))=6THENPRINT:PRINT"YOU OPEN THE CHEST AND":PRINT:GOTO1430
1320 IFPEEK(FND(Z))=12THENPRINT:PRINT"YOU OPEN THE BOOK AND":PRINT:GOTO1340
1330 PRINT:PRINT"** THE ONLY THING YOU OPENED WAS YOUR BIG MOUTH":GOTO620
1340 ONFNA(6)GOTO1350,1360,1370,1380,1390,1400
1350 PRINT"FLASH! OH NO! YOU ARE NOW BLIND ";R$(RC):BL=1:GOTO1420
1360 PRINT"ITS ANOTHER VOLUME OF ZOT'S POETRY! - YEECH!":GOTO1420
1370 PRINT"ITS AN OLD COPY OF PLAY";R$(FNA(4)):GOTO1420
1380 PRINT"ITS A MANUAL OF DEXTERITY!":DX=18:GOTO1420
1390 PRINT"ITS A MANUAL OF STRENGTH!":ST=18:GOTO1420
1400 PRINT"THE BOOK STICKS TO YOUR HANDS -":PRINT
1410 PRINT"NOW YOU CAN'T DRAW YOUR WEAPON!":BF=1
1420 POKEFND(Z),1:GOTO620
1430 ONFNA(4)GOTO1440,1450,1460,1450
1440 PRINT"KABOOM! IT EXPLODES":Q=FNA(6):GOSUB2300:ON1-(ST<1)GOTO1420,2840
1450 Q=FNA(1000):PRINT"FIND ";Q;" GOLD PIECES":GP=GP+Q:GOTO1420
1460 PRINT"GAS! YOU STAGGER FROM THE ROOM"
1470 POKEFND(Z),1:T=T+20:O$=MID$("NSEW",FNA(4),1):GOTO950
1480 IFPEEK(FND(Z))<>11THENPRINT:PRINT"** NO ORB - NO GAZE":GOTO620
1490 PRINT:PRINT"YOU SEE ";:ONFNA(6)GOTO1500,1510,1530,1540,1560,1580
1500 PRINT"YOURSELF IN A BLOODY HEAP":ST=ST-FNA(2):ON1-(ST<1)GOTO620,2840
1510 PRINT"YOURSELF DRINKING FROM A POOL AND BECOMING ";C$(12+FNA(13))
1520 GOTO620
1530 PRINTC$(12+FNA(13));" GAZING BACK AT YOU":GOTO620
1540 A=X:B=Y:C=Z:X=FNA(8):Y=FNA(8):Z=FNA(8):Q=FNE(PEEK(FND(Z))):POKEFND(Z),Q
1550 PRINTC$(Q);" AT (";X;",";Y;") LEVEL ";Z:X=A:Y=B:Z=C:GOTO620
1560 A=FNA(8):B=FNA(8):C=FNA(8):IFFNA(8)<4THENA=O(1):B=O(2):C=O(3)
1570 PRINT"THE ORB OF ZOT AT (";A;",";B;") LEVEL ";C:GOTO620
1580 PRINT"A SOAP OPERA RERUN":GOTO620
1590 IFRF=0THENPRINT:PRINT"** YOU CAN'T TELEPORT WITHOUT THE RUNESTAFF!":GOTO620
1600 Z$="X-COORD (1=FAR NORTH 8=FAR SOUTH) ":GOSUB3350:X=Q
1610 Z$="Y-COORD (1=FAR WEST  8=FAR EAST ) ":GOSUB3350:Y=Q
1620 Z$="LEVEL   (1=TOP       8=BOTTOM   ) ":GOSUB3350:Z=Q
1630 O$="T":GOTO1670
1640 PRINT:PRINT"DO YOU REALLY WANT TO QUIT ";:GOSUB3290:PRINT
1650 IFO$<>"Y"THENPRINT"** THEN DON'T SAY YOU DO":GOTO620
1660 PRINT:PRINT:GOTO2940
1670 PRINT:IFBL=0THENGOSUB3400:PRINT
1680 PRINT"ST= ";ST;" IQ= ";IQ;" DX= ";DX;" FLARES= ";FL;" GP's= ";GP
1690 PRINT:PRINTW$(WV+1);" / ";W$(AV+5);:IFLF=1THENPRINT" / A LAMP";
1700 PRINT:PRINT:WC=0:Q=FNE(PEEK(FND(Z))):POKEFND(Z),Q:Z$="YOU HAVE "
1710 PRINT"HERE YOU FIND ";C$(Q):IF(Q<7)OR(Q=11)OR(Q=12)THEN620
1720 IFQ=7THENGP=GP+FNA(10):PRINT:PRINTZ$;GP:GOTO1420
1730 IFQ=8THENFL=FL+FNA(5):PRINT:PRINTZ$;FL:GOTO1420
1740 IFQ>9THEN1770
1750 PRINT:IF(O(1)=X)AND(O(2)=Y)AND(O(3)=Z)THENON1-(O$="T")GOTO950,3050
1760 X=FNA(8):Y=FNA(8):Z=FNA(8):GOTO1670
1770 IFQ=10THENZ=FNB(Z+1):GOTO1670
1780 IFQ>25ANDQ<34THENPRINT:PRINT"ITS NOW YOURS":T(Q-25)=1:TC=TC+1:GOTO1420
1790 A=PEEK(FND(Z))-12:WC=0:IF(A<13)OR(VF=1)THEN2300
1800 PRINT:PRINT"YOU MAY TRADE WITH, ATTACK, OR IGNORE THE VENDOR"
1810 GOSUB3280:IFO$="I"THEN620
1820 IFO$="A"THENVF=1:PRINT:PRINT"YOU'LL BE SORRY YOU DID THAT":GOTO2300
1830 IFO$<>"T"THENPRINT:PRINT"** NICE SHOT, ";R$(RC):GOTO1800
1840 PRINT:FORQ=1TO8:A=FNA(Q*1500):IFT(Q)=0THEN1880
1850 PRINT:PRINT"DO YOU WANT TO SELL ";C$(Q+25);" FOR ";A;" GP's ";
1860 GOSUB3290:IFO$="Y"THENTC=TC-1:T(Q)=0:GP=GP+A:GOTO1880
1870 IFO$<>"N"THENPRINTY$:GOTO1850
1880 NEXTQ
1890 IFGP<1E3THENPRINT:PRINT"YOU'RE TOO POOR TO TRADE, ";R$(RC):GOTO620
1900 IFGP<1250THEN2130
1910 PRINT:PRINT"OK, ";R$(RC);", YOU HAVE ";GP;" GOLD PIECES AND ";W$(AV+5)
1920 PRINT:Z$="ARMOR":GOSUB3390:PRINT"NOTHING<0> LEATHER<1250> ";
1930 IFGP>1499THENPRINT"CHAINMAIL<1500> ";:IFGP>1999THENPRINT"PLATE<2000>";
1940 PRINT:GOSUB3280:PRINT:IFO$="N"THEN2010
1950 IFO$="L"THENGP=GP-1250:AV=1:AH=7:GOTO2010
1960 IFO$="C"ANDGP<1500THENPRINT"** YOU HAVEN'T GOT THAT MUCH CASH":GOTO1920
1970 IFO$="C"THENGP=GP-1500:AV=2:AH=14:GOTO2010
1980 IFO$="P"ANDGP<2000THENPRINT"** YOU CAN'T AFFORD PLATE":GOTO1920
1990 IFO$="P"THENGP=GP-2000:AV=3:AH=21:GOTO2010
2000 PRINT:PRINT"** DON'T BE SILLY. CHOOSE A SELECTION":GOTO1940
2010 IFGP<1250THEN2130
2020 PRINT:PRINT"YOU HAVE ";GP;" GP's LEFT WITH ";W$(WV+1);" IN HAND":PRINT
2030 PRINT:Z$="WEAPON":GOSUB3390:PRINT"NOTHING<0> DAGGER<1250> ";
2040 IFGP>1499THENPRINT"MACE<1500> ";:IFGP>1999THENPRINT"SWORD<2000>";
2050 PRINT:GOSUB3280:PRINT:IFO$="N"THEN2130
2060 IFO$="D"THENGP=GP-1250:WV=1:GOTO2130
2070 IFO$="M"ANDGP<1500THENPRINT"** SORRY SIR, I DON'T GIVE CREDIT":GOTO2030
2080 IFO$="M"THENGP=GP-1500:WV=2:GOTO2130
2090 IFO$="S"ANDGP<2000THENPRINT"** DUNGEON EXPRESS CARD - ";
2100 IFO$="S"ANDGP<2000THENPRINT"YOU LEFT HOME WITHOUT IT!":GOTO2030
2110 IFO$="S"THENGP=GP-2000:WV=3:GOTO2130
2120 PRINT"** TRY CHOOSING A SELECTION":GOTO2050
2130 IFGP<1000THEN620
2140 Z$="STRENGTH":GOSUB3370:IFO$<>"Y"THEN2160
2150 GP=GP-1E3:ST=FNC(ST+FNA(6)):Q=ST:GOSUB3380:GOTO2130
2160 IFO$<>"N"THENPRINTY$:GOTO2140
2170 IFGP<1000THEN620
2180 Z$="INTELLIGENCE":GOSUB3370:IFO$<>"Y"THEN2200
2190 GP=GP-1E3:IQ=FNC(IQ+FNA(6)):Q=IQ:GOSUB3380:GOTO2170
2200 IFO$<>"N"THENPRINTY$:GOTO2180
2210 IFGP<1000THEN620
2220 Z$="DEXTERITY":GOSUB3370:IFO$<>"Y"THEN2240
2230 GP=GP-1E3:DX=FNC(DX+FNA(6)):Q=DX:GOSUB3380:GOTO2210
2240 IFO$<>"N"THENPRINTY$:GOTO2220
2250 IF(GP<1000)OR(LF=1)THEN620
2260 PRINT:PRINT"WANT A LAMP FOR 1000 GP's ";:GOSUB3290:IFO$<>"Y"THEN2280
2270 GP=GP-1000:LF=1:PRINT:PRINT"ITS GUARANTEED TO OUTLIVE YOU!":GOTO620
2280 IFO$<>"N"THENPRINTY$:GOTO2260
2290 GOTO620
2300 Q1=1+INT(A/2):Q2=A+2:Q3=1
2310 IF(C(1,4)>T(1))OR(BL=1)OR(DX<FNA(9)+FNA(9))THEN2690
2320 PRINT:PRINT:PRINT"YOU'RE FACING ";C$(A+12):PRINT:PRINT"YOU MAY ATTACK OR RETREAT";
2330 IFQ3=1THENPRINT", OR BRIBE";:IFIQ>14THENPRINT", OR CAST A SPELL";
2340 PRINT:PRINT:PRINT"YOUR STRENGTH IS ";ST;" AND DEXTERITY IS ";DX:PRINT:GOSUB3280
2350 IFO$<>"A"THEN2480
2360 IFWV=0THENPRINT:PRINT"** POUNDING ON ";C$(12+A);" WON'T HURT IT":GOTO2690
2370 IFBF=1THENPRINT:PRINT"** YOU CAN'T BEAT IT TO DEATH WITH A BOOK":GOTO2690
2380 IFDX<FNA(20)+(BL*3)THENPRINT:PRINT"  DRAT! MISSED":GOTO2690
2390 PRINT:PRINT"  YOU HIT THE LOUSY ";RIGHT$(C$(A+12),LEN(C$(A+12))-2):Q2=Q2-WV
2400 IF(A=9ORA=12)ANDFNA(8)=1THENPRINT:PRINT"OH NO! YOUR ";W$(WV+1);" BROKE":WV=0
2410 IFQ2>0THEN2690
2420 PRINT:MC=MC-1:PRINTC$(A+12);" LIES DEAD AT YOUR FEET":IFH>T-60THEN2440
2430 PRINT:PRINT"YOU SPEND AN HOUR EATING ";C$(A+12);E$(FNA(8)):H=T
2440 IFX<>R(1)ORY<>R(2)ORZ<>R(3)THENON1-(A=13)GOTO2460,3220
2450 PRINT:PRINT"GREAT ZOT! YOU'VE FOUND THE RUNESTAFF":R(1)=0:RF=1
2460 Q=FNA(1000):PRINT:PRINT"YOU NOW GET HIS HOARD OF ";Q;" GP's"
2470 GP=GP+Q:GOTO1420
2480 IFO$="R"THEN2690
2490 IF(O$<>"C")THEN2610
2500 IFIQ<15ORQ3>1THENPRINT:PRINT"**  YOU CAN'T CAST A SPELL NOW!":GOTO2320
2510 PRINT:PRINT"WHICH SPELL (WEB, FIREBALL, OR DEATHSPELL) ";:GOSUB3290:PRINT
2520 IFO$<>"W"THEN2540
2530 ST=ST-1:WC=FNA(8)+1:ON1-(ST<1)GOTO2690,2840
2540 IFO$<>"F"THEN2580
2550 Q=FNA(7)+FNA(7):ST=ST-1:IQ=IQ-1:IF(IQ<1)OR(ST<1)THEN2840
2560 PRINT"  IT DOES ";Q;" POINTS OF DAMAGE.":PRINT
2570 Q2=Q2-Q:GOTO2410
2580 IFO$<>"D"THENPRINT:PRINT"*## TRY ONE OF THE OPTIONS GIVEN":GOTO2320
2590 PRINT"DEATH - - - ";:IFIQ<15+FNA(4)THENPRINT"YOURS":IQ=0:GOTO2840
2600 PRINT"HIS":PRINT:Q2=0:GOTO2420
2610 IFO$<>"B"ORQ3>1THENPRINT:PRINT"** CHOOSE ONE OF THE LISTED OPTIONS":GOTO2320
2620 IFTC=0THENPRINT:PRINT"'ALL I WANT IS YOUR LIFE!'":GOTO2690
2630 Q=FNA(8):IFT(Q)=0THEN2630
2640 PRINT:PRINT"I WANT ";C$(Q+25);", WILL YOU GIVE IT TO ME ";
2650 GOSUB3290:IFO$="N"THEN2690
2660 IFO$<>"Y"THENPRINTY$:GOTO2640
2670 T(Q)=0:TC=TC-1:PRINT:PRINT"OK, JUST DON'T TELL ANYONE"
2680 VF=VF+(PEEK(FND(Z))=25):GOTO620
2690 Q3=2:IFWC>0THENWC=WC-1:IFWC=0THENPRINT:PRINT"THE WEB JUST BROKE!"
2700 Z$=RIGHT$(C$(12+A),LEN(C$(12+A))-2):IFWC<=0THEN2720
2710 PRINT:PRINT"THE ";Z$;" IS STUCK AND CAN'T ATTACK":GOTO2750
2720 PRINT:PRINT"THE ";Z$;" ATTACKS":IFDX<FNA(7)+FNA(7)+FNA(7)+BL*3THEN2740
2730 PRINT:PRINT"  HAH! HE MISSED YOU!":GOTO2750
2740 PRINT:PRINT"  OUCH! HE HIT YOU":Q=Q1:GOSUB2800:IFST<1THEN2840
2750 IFO$<>"R"THEN2320
2760 PRINT:PRINT"YOU HAVE ESCAPED":PRINT
2770 PRINT"DO YOU GO NORTH, SOUITH, EAST, OR WEST ";:GOSUB3290
2780 IF(O$="N")OR(O$="S")OR(O$="E")OR(O$="W")THEN 950
2790 PRINT:PRINT"** DON'T PRESS YOUR LUCK ";R$(RC):PRINT:GOTO2770
2800 IFAV=0THEN2830
2810 Q=Q-AV:AH=AH-AV:IFQ<0THENAH=AH-Q:Q=0
2820 IFAH<0THENAH=0:AV=0:PRINT:PRINT"YOUR ARMOR IS DESTROYED - GOOD LUCK"
2830 ST=ST-Q:RETURN
2840 FORQ=1TO750:NEXTQ:PRINTCHR$(12):GOSUB3270
2850 PRINT"A NOBLE EFFORT, OH FORMERLY LIVING ";R$(RC):PRINT
2860 PRINT"YOU DIED FROM A LACK OF ";:IFST<1THENPRINT"STRENGTH"
2870 IFIQ<1THENPRINT"INTELLIGENCE"
2880 IFDX<1THENPRINT"DEXTERITY"
2890 PRINT:PRINT:Q3=1:PRINT"WHEN YOU DIED YOU HAD:":PRINT:GOTO2970
2900 Q3=0:PRINT:PRINT"YOU LEFT THE CASTLE WITH";:IFOF=0THENPRINT"OUT";
2910 PRINT" THE ORB OF ZOT":PRINT:IFOF=0THEN2940
2920 PRINT:PRINT"A GLORIOUS VICTORY!":PRINT
2930 PRINT"YOU ALSO GOT OUT WITH THE FOLLOWING:":PRINT:GOTO2960
2940 PRINT:PRINT"A LESS THAN AWE-INSPIRING DEFEAT."
2950 PRINT:PRINT"WHEN YOU LEFT THE CASTLE YOU HAD:":PRINT
2960 IFQ3=0THENPRINT"YOUR MISERABLE LIFE"
2970 FORQ=1TO8:IFT(Q)=1THENPRINTC$(Q+25)
2980 NEXTQ:PRINTW$(WV+1):PRINTW$(AV+5):IFLF=1THENPRINT"A LAMP"
2990 PRINTFL;" FLARES":PRINTGP;" GP's":IFRF=1THENPRINT"THE RUNESTAFF"
3000 PRINT:PRINT"AND IT TOOK YOU ";T;" TURNS!":PRINT
3010 PRINT:PRINT:PRINT"PLAY AGAIN ";:GOSUB3290:PRINT
3020 IFO$="Y"THENPRINT"SOME ";R$(RC);"S NEVER LEARN":PRINT:PRINT:GOTO 80
3030 IFO$<>"N"THENPRINTY$:GOTO3010
3040 PRINT"MAYBE DUMB ";R$(RC);" NOT SO DUMB AFTER ALL":PRINT:END
3050 PRINT:PRINT"GREAT UNMITIGATED ZOT!":PRINT
3060 PRINT"YOU JUST FOUND THE ORB OF ZOT!":PRINT
3070 PRINT"THE RUNESTAFF IS GONE":RF=0:OF=1:O(1)=0:GOTO1420
3080 DATAAN EMPTY ROOM,.,THE ENTRANCE,E,STAIRS GOING UP,U
3090 DATASTAIRS GOING DOWN,D,A POOL,P,A CHEST,C,GOLD PIECES,G
3100 DATAFLARES,F,A WARP,W,A SINKHOLE,S,A CRYSTAL ORB,O
3110 DATAA BOOK,B,A KOBOLD,M,AN ORC,M,A WOLF,M,A GOBLIN,M,AN OGRE,M
3120 DATAA TROLL,M,A BEAR,M,A MINOTAUR,M,A GARGOYLE,M,A CHIMERA,M
3130 DATAA BALROG,M,A DRAGON,M,A VENDOR,V,THE RUBY RED,T
3140 DATATHE NORN STONE,T,THE PALE PEARL,T,THE OPAL EYE,T
3150 DATATHE GREEN GEM,T,THE BLUE FLAME,T,THE PALANTIR,T,THE SILMARIL
3160 DATAT,X,"?",NO WEAPON,WICH
3170 DATADAGGER," STEW",MACE," SOUP",SWORD," BURGER",NO ARMOR," ROAST"
3180 DATALEATHER," MUNCHY",CHAINMAIL," TACO",PLATE," PIE"
3190 DATAHOBBIT,ELF,MAN,DWARF,T,I,A,L,I,Z,I,N," ",C,A
3200 X=FNA(8):Y=FNA(8):IFPEEK(FND(Z))<>101THEN3200
3210 POKEFND(Z),Q:RETURN
3220 PRINT:PRINT"YOU GET ALL HIS WARES:":PRINT:PRINT"PLATE ARMOR":AV=3:AH=21
3230 PRINT"A SWORD":WV=3:PRINT"A STRENGTH POTION":ST=FNC(ST+FNA(6))
3240 PRINT"AN INTELLIGENCE POTION":IQ=FNC(IQ+FNA(6))
3250 PRINT"A DEXTERITY POTION":DX=FNC(DX+FNA(6)):IFLF=0THENPRINT"A LAMP":LF=1
3260 GOTO2460
3270 FORQ=1TO64:PRINT"*";:NEXTQ:PRINT:PRINT:RETURN
3280 PRINT:PRINT"YOUR CHOICE ";
3290 INPUTO$:O$=LEFT$(O$,1):RETURN
3300 PRINT"HOW MANY POINTS DO YOU ADD TO ";Z$;:INPUTO$:PRINT
3310 Q=VAL(O$):IF(Q=0)AND(ASC(O$)<>48)THENQ=-1
3320 IF(Q<0)OR(Q>OT)OR(Q<>INT(Q))THENPRINT"** ";:GOTO 3300
3330 OT=OT-Q:RETURN
3340 INPUTO$:Q=INT(VAL(O$)):RETURN
3350 PRINT:PRINTZ$;:INPUTO$:Q=INT(VAL(O$)):IF(Q>0)AND(Q<9)THENRETURN
3360 PRINT:PRINT"** TRY A NUMBER FROM 1 TO 8":GOTO3350
3370 PRINT:PRINT"WANT TO BUY A POTION OF ";Z$;" FOR 1000 GP's ";:GOTO3290
3380 PRINT:PRINT"YOUR ";Z$;" IS NOW ";Q:RETURN
3390 PRINT"HERE IS A LIST OF ";Z$;" YOU CAN BUY (WITH COST IN <>)":PRINT:RETURN
3400 PRINT"YOU ARE AT (";X;",";Y;") LEVEL ";Z:RETURN
