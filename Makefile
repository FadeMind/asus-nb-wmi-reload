SYSTEMDDIR=$(DESTDIR)/usr/lib/systemd/system
BINDIR=$(DESTDIR)/usr/share/bin

all:

install: local

clear:
	-rm -rf $(SYSTEMDDIR)asus-nb-wmi-reload.service
	-rm -rf $(BINDIR)asus-nb-wmi-reload
	-rm -rf $(ETCDIR)asus-nb-wmi-reload.service
local:
	install -Dm644 asus-nb-wmi-reload.service $(SYSTEMDDIR)/asus-nb-wmi-reload.service
	install -Dm755 asus-nb-wmi-reload         $(BINDIR)/asus-nb-wmi-reload
uninstall: clear
