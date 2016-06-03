# PATHES
SYSTEMD_DIR = $(DESTDIR)/usr/lib/systemd/system
MODPROBED_DIR = $(DESTDIR)/usr/lib/modprobe.d
XDG_AUTOSTART_DIR = $(DESTDIR)/etc/xdg/autostart
UDEV_DIR = $(DESTDIR)/etc/udev/rules.d
BIN_DIR = $(DESTDIR)/usr/bin

# COMMANDS
RM = rm -rf
CP = cp -Rf
INSTALL_D = install -d
INSTALL_BIN = install -Dm755
INSTALL_STD = install -Dm644

# FILES
DESKTOP_FILE_ATK = atk.desktop
SERVICE_FILE_WMI = asus-nb-wmi-reload.service
EXEC_FILE_ATK= atk
EXEC_FILE_WMI = asus-nb-wmi-reload
CONF_FILE_ATK = atk.conf
UDEV_FILE_BT = 90-bluetooth.rules 

all:

install: local

clear:
	$(RM) $(UDEV_DIR)/$(UDEV_FILE_BT)
	$(RM) $(XDG_AUTOSTART_DIR)/$(DESKTOP_FILE_ATK)
	$(RM) $(SYSTEMD_DIR)/$(SERVICE_FILE_WMI)
	$(RM) $(BIN_DIR)/$(EXEC_FILE_ATK)
	$(RM) $(BIN_DIR)/$(EXEC_FILE_WMI)
	$(RM) $(MODPROBED_DIR)/$(CONF_FILE_ATK)
local:	
	$(INSTALL_D) $(UDEV_DIR)
	$(CP) $(UDEV_FILE_BT) $(UDEV_DIR)/
	$(INSTALL_STD) $(DESKTOP_FILE_ATK) $(XDG_AUTOSTART_DIR)/$(DESKTOP_FILE_ATK)
	$(INSTALL_STD) $(SERVICE_FILE_WMI) $(SYSTEMD_DIR)/$(SERVICE_FILE_WMI)
	$(INSTALL_BIN) $(EXEC_FILE_ATK) $(BIN_DIR)/$(EXEC_FILE_ATK)
	$(INSTALL_BIN) $(EXEC_FILE_WMI) $(BIN_DIR)/$(EXEC_FILE_WMI)
	$(INSTALL_STD) $(CONF_FILE_ATK) $(MODPROBED_DIR)/$(CONF_FILE_ATK)
	
uninstall: clear
