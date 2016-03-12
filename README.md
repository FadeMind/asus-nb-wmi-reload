# asus-nb-wmi-reload

Systemd service for reload Asus Notebooks WMI Hotkey Driver after resume for restoring light on WLAN LED.

### ISSUE

On ASUS devices with WLAN LED after resume from suspend WLAN LED status is not restored properly.<br/>
Safer solution for now is unloading and loading `asus-nb-wmi` module via systemd service.

**DEPENDS**

 - `bash`
 - `kmod`
 - `systemd` 

**ARCH LINUX INSTALLATION**

    yaourt -S asus-nb-wmi-reload-git

**LICENSE**

See `COPYING.GPL2` file for details.
