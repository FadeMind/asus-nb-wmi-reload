#!/usr/bin/make -f

SYSTEMD_DIR = $(DESTDIR)/usr/lib/systemd/system
UDEV_DIR = $(DESTDIR)/etc/udev/rules.d
BIN_DIR = $(DESTDIR)/usr/bin

RM = rm -rf
CP = cp -Rf
INSTALL_D = install -d
INSTALL_BIN = install -Dm755
INSTALL_STD = install -Dm644

SERVICE_FILE_WMI = asus-nb-wmi-reload.service
EXEC_FILE_WMI = asus-nb-wmi-reload
UDEV_FILE_BT = 90-bluetooth.rules

install: local

clear:
	$(RM) $(UDEV_DIR)/$(UDEV_FILE_BT)
	$(RM) $(SYSTEMD_DIR)/$(SERVICE_FILE_WMI)
	$(RM) $(BIN_DIR)/$(EXEC_FILE_WMI)
local:	
	$(INSTALL_STD) $(UDEV_FILE_BT) $(UDEV_DIR)/$(UDEV_FILE_BT)
	$(INSTALL_STD) $(SERVICE_FILE_WMI) $(SYSTEMD_DIR)/$(SERVICE_FILE_WMI)
	$(INSTALL_BIN) $(EXEC_FILE_WMI) $(BIN_DIR)/$(EXEC_FILE_WMI)
	
uninstall: clear
