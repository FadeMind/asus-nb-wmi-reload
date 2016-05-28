SYSTEMD_DIR=$(DESTDIR)/usr/lib/systemd/system
BIN_DIR=$(DESTDIR)/usr/bin
SERVICE_FILE=asus-nb-wmi-reload.service
EXEC_FILE=asus-nb-wmi-reload

all:

install: local

clear:
	-rm -rf $(SYSTEMD_DIR)$(SERVICE_FILE)
	-rm -rf $(BIN_DIR)$(EXEC_FILE)
local:
	install -Dm644 $(SERVICE_FILE) $(SYSTEMD_DIR)/$(SERVICE_FILE)
	install -Dm755 $(EXEC_FILE) $(BIN_DIR)/$(EXEC_FILE)
uninstall: clear
