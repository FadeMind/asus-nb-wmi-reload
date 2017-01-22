#!/usr/bin/make -f

PREFIX          =   /usr
BIN_PATH        =   $(DESTDIR)/$(PREFIX)/bin
SYSTEMD_PATH    =   $(DESTDIR)/$(PREFIX)/lib/systemd/system
UDEV_PATH       =   $(DESTDIR)/$(PREFIX)/udev/rules.d
XDG_PATH        =   $(DESTDIR)/etc/xdg/autostart
DEL             =   rm -rf
INS_BIN         =   install -Dm755
INS_STD         =   install -Dm644
BTFIX_DESKTOP   =   btfix.desktop
BTFIX_EXE       =   btfix
BTFIX_UDEV      =   90-bluetooth.rules
SERVICE_WMI     =   asus-nb-wmi-reload.service
WMI_EXE         =   asus-nb-wmi-reload

install:
    $(INS_BIN) $(BTFIX_EXE)     $(BIN_PATH)/$(BTFIX_EXE)
    $(INS_BIN) $(WMI_EXE)       $(BIN_PATH)/$(WMI_EXE)
    $(INS_STD) $(BTFIX_DESKTOP) $(XDG_PATH)/$(BTFIX_DESKTOP)
    $(INS_STD) $(BTFIX_UDEV)    $(UDEV_PATH)/$(BTFIX_UDEV)
    $(INS_STD) $(SERVICE_WMI)   $(SYSTEMD_PATH)/$(SERVICE_WMI)

uninstall:
    $(DEL) $(BIN_PATH)/$(BTFIX_EXE)
    $(DEL) $(BIN_PATH)/$(WMI_EXE)
    $(DEL) $(SYSTEMD_PATH)/$(SERVICE_WMI)
    $(DEL) $(UDEV_PATH)/$(BTFIX_UDEV)
    $(DEL) $(XDG_PATH)/$(BTFIX_DESKTOP)
