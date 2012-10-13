include config.mk

SRC = luahelloworld.c
OBJ = ${SRC:.c=.o}

all: helloworld.so

.c.o:
	${CC} -c ${CFLAGS} $<

${OBJ}: config.mk

helloworld.so: ${OBJ}
	${CC} -o $@ ${OBJ} ${LDFLAGS}

clean:
	rm -f helloworld.so ${OBJ}

install: all
	mkdir -p ${DESTDIR}${PREFIX}/lib/lua/${LUA}
	cp -f helloworld.so ${DESTDIR}${PREFIX}/lib/lua/${LUA}/

.PHONY: all clean install
