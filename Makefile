#!/usr/bin/make -f

PREFIX = /usr
BIN_DIR = $(DESTDIR)$(PREFIX)/bin
MODPROBED_DIR = $(DESTDIR)$(PREFIX)/modprobe.d
SYSTEMD_DIR = $(DESTDIR)$(PREFIX)/lib/systemd/system
UDEV_DIR = $(DESTDIR)$(PREFIX)/udev/rules.d
XDG_AUTOSTART_DIR = $(DESTDIR)/etc/xdg/autostart

RM = rm -rf
CP = cp -Rf
INSTALL_D = install -d
INSTALL_BIN = install -Dm755
INSTALL_STD = install -Dm644

BTFIX_FILE_AUTOSTART = btfix.desktop
BTFIX_FILE_CONF = blacklist_btusb.conf
BTFIX_FILE_EXE = btfix
BTFIX_FILE_UDEV = 90-bluetooth.rules
SERVICE_FILE_WMI = asus-nb-wmi-reload.service
WMI_FILE_EXE = asus-nb-wmi-reload


install: local

clear:
	$(RM) $(BIN_DIR)$(BTFIX_FILE_EXE)
	$(RM) $(BIN_DIR)$(WMI_FILE_EXE)
	$(RM) $(MODPROBED_DIR)$(BTFIX_FILE_CONF)
	$(RM) $(SYSTEMD_DIR)$(SERVICE_FILE_WMI)
	$(RM) $(UDEV_DIR)$(BTFIX_FILE_UDEV)
	$(RM) $(XDG_AUTOSTART_DIR)$(BTFIX_FILE_AUTOSTART)
local:	
	$(INSTALL_BIN) $(BTFIX_FILE_EXE) $(BIN_DIR)$(BTFIX_FILE_EXE)
	$(INSTALL_BIN) $(WMI_FILE_EXE) $(BIN_DIR)$(WMI_FILE_EXE)
	$(INSTALL_STD) $(BTFIX_FILE_AUTOSTART) $(XDG_AUTOSTART_DIR)$(BTFIX_FILE_AUTOSTART)
	$(INSTALL_STD) $(BTFIX_FILE_CONF) $(MODPROBED_DIR)$(BTFIX_FILE_CONF)
	$(INSTALL_STD) $(BTFIX_FILE_UDEV) $(UDEV_DIR)$(BTFIX_FILE_UDEV)
	$(INSTALL_STD) $(SERVICE_FILE_WMI) $(SYSTEMD_DIR)$(SERVICE_FILE_WMI)
	
uninstall: clear
