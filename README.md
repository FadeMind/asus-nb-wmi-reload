# asus-nb-wmi-reload

Systemd services for:
- reload `asus-nb-wmi` after resume for restoring light on WLAN LED.
- properly load `asus-nb-wmi` driver during boot with delay time and call bluetooth device ON.

### ISSUE

On ASUS devices with WLAN LED after resume from suspend WLAN LED status is not restored properly.<br/>
Safer solution for now is unloading and loading `asus-nb-wmi` module via systemd service.

Since kernel 4.6.1 I noticed issue with WLAN LED and Bluetooth.
Sometimes bluetooth device is not available at all, so I blacklist `asus-nb-wmi` module, and it is loaded with delay AND bluetooth device is turn ON via `hciconfig` tool.

**DEPENDS**

 - `bash`
 - `kmod`
 - `systemd` 

**ARCH LINUX INSTALLATION**

```
yaourt -S asus-nb-wmi-reload-git && sudo systemctl enable asus-nb-wmi-reload
```

**LICENSE**

See `COPYING.GPL2` file for details.
