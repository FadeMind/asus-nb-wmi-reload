# asus-nb-wmi-reload

Systemd services for reload `asus-nb-wmi` after resume for restoring light on WLAN LED.
Autostart desktop file for properly load `btusb` driver after finish boot with delay time for properly launch bluetooth device ON.

## ISSUE

On ASUS devices with WLAN LED after resume from suspend WLAN LED status is not restored properly.<br/>
Safer solution for now is unloading and loading `asus-nb-wmi` module via systemd service.

Since kernel 4.6.1 I noticed issue with WLAN LED and Bluetooth.
Sometimes bluetooth device is not available at all, so bluetooth device is turn ON via `hciconfig` tool during boot.

## DEPENDS

 - `bash`
 - `bluez-utils`
 - `kmod`
 - `systemd` 

## ARCH LINUX INSTALLATION

```
yaourt -S --noconfirm asus-nb-wmi-reload-git
```

## LICENSE

See `COPYING.GPL2` file for details.

## REFERENCE

 - https://bugzilla.kernel.org/show_bug.cgi?id=64671
