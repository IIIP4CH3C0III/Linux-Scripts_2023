CC		= gcc
OP		= -Wall
LIB		= -lncurses

F1		= scr/main
F2		= scr/display
F3		= scr/system
F4		= scr/printing
F5		= scr/settings

N 		= dmtui

compile:	${F1}.o ${F2}.o ${F3}.o ${F4}.o ${F5}.o moveF
			${CC} -o ${N} ${F1}.o ${F2}.o ${F3}.o ${F4}.o ${F5}.o ${LIB} ${OP};
			rm scr/*.o 

${F1}.o:	${F1}.c
			${CC} -c ${F1}.c ${OP}

${F2}.o:	${F2}.c
			${CC} -c ${F2}.c ${OP}

${F3}.o:	${F3}.c
			${CC} -c ${F3}.c ${OP}

${F4}.o:	${F4}.c
			${CC} -c ${F4}.c ${OP}

${F5}.o:	${F5}.c
			${CC} -c ${F5}.c ${OP}

moveF:
			mv *.o scr/

assembly:	${F1}.c ${F2}.c ${F3}.c ${F4}.c ${F5}.c
			${CC} -S ${F1}.c ${F2}.c ${F3}.c ${F4}.c ${F5}.c ${LIB};
			mv *.s ass/
			
remove:
			rm *.o
