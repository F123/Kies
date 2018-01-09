#PREFIX=/usr/local
BINDIR=$(PREFIX)/bin
DATADIR=$(PREFIX)/share/kies
clean:
	echo "nothing to clean for now".
	
install: 
 
	./install.sh --prefix=$(PREFIX) --destdir=$(DESTDIR)
