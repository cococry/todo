CC=gcc
BIN=todo
SOURCE=*.c
LIBS=-lglfw -lleif -lclipboard -lm -lGL -lxcb

.PHONY: all clean install uninstall

all:
	$(CC) -o $(BIN) $(SOURCE) $(LIBS)

clean:
	rm -f $(BIN)

install:
	cp $(BIN) /usr/bin/
	cp ./todo.desktop /usr/share/applications
	@mkdir -p /usr/share/icons/todo
	cp ./appicon/appicon.png /usr/share/icons/todo
	@mkdir -p /usr/share/todo
	cp -r ./fonts/ /usr/share/todo/
	cp -r ./icons/ /usr/share/todo/

uninstall:
	rm -f /usr/bin/todo
	rm -f /usr/share/applications/todo.desktop
	rm -f ~/.tododata
	rm -rf /usr/share/icons/todo/
	rm -rf /usr/share/todo/