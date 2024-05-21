CC=gcc
BIN=todo
SOURCE=*.c
LIBS=-lglfw -lleif -lclipboard -lm -lGL -lxcb

all:
	${CC} -o ${BIN} ${SOURCE} ${LIBS}

clean:
	rm -f ${BIN}

install:
	cp ${BIN} /usr/bin/
