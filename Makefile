SYSTEMD_DIR=$(DESTDIR)/usr/lib/systemd/system
MODPROBED_DIR=$(DESTDIR)/usr/lib/modprobe.d
RM = rm -rf
BIN_DIR=$(DESTDIR)/usr/bin
SERVICE_FILE_ATK = atk.service
SERVICE_FILE_WMI = asus-nb-wmi-reload.service
EXEC_FILE_ATK= atk
EXEC_FILE_WMI = asus-nb-wmi-reload
ATK_FILE = atk.conf

all:

install: local

clear:
	$(RM) $(SYSTEMD_DIR)/$(SERVICE_FILE_ATK)
	$(RM) $(SYSTEMD_DIR)/$(SERVICE_FILE_WMI)
	$(RM) $(BIN_DIR)/$(EXEC_FILE_ATK)
	$(RM) $(BIN_DIR)/$(EXEC_FILE_WMI)
	$(MODPROBED_DIR)/$(ATK_FILE)
local:
	install -Dm644 $(SERVICE_FILE_ATK) $(SYSTEMD_DIR)/$(SERVICE_FILE_ATK)
	install -Dm644 $(SERVICE_FILE_WMI) $(SYSTEMD_DIR)/$(SERVICE_FILE_WMI)
	install -Dm755 $(EXEC_FILE_ATK) $(BIN_DIR)/$(EXEC_FILE_ATK)
	install -Dm755 $(EXEC_FILE_WMI) $(BIN_DIR)/$(EXEC_FILE_WMI)
	install -d $(MODPROBED_DIR)
	echo "blacklist asus-nb-wmi" >> $(MODPROBED_DIR)/$(ATK_FILE)
	
uninstall: clear
