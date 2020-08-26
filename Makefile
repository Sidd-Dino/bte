PREFIX ?= /usr

all:
	@echo Run \'make install\' to install bte.

install:
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@cp -p fff $(DESTDIR)$(PREFIX)/bin/bte
	@chmod 755 $(DESTDIR)$(PREFIX)/bin/bte

uninstall:
	@rm -rf $(DESTDIR)$(PREFIX)/bin/bte