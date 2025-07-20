https://github.com/emersion/xdg-desktop-portal-wlr/wiki/%22It-doesn't-work%22-Troubleshooting-Checklist

```
runit

    runit is a cross-platform Unix init scheme with service supervision, a replacement for sysvinit, and other init schemes. It runs on GNU/Linux, *BSD, MacOSX, Solaris, and can easily be adapted to other Unix operating systems. If runit runs for you on any other operating system, please let me know.

according to runit's website http://smarden.org/runit/
Issues in Void Linux

There is a chance that running pipewire and pipewire-pulse as a runit service daemon will not work with xdg-desktop-portal-wlr. Thus, you cannot start screencasting properly. The solution is instead of starting them as services, you should manually start pipewire and pipewire-pulse in your sway/river config. Additional configuration maybe required such as adding a config file on ~/.config/xdg-desktop-portal-wlr with the following lines:

[screencast]
output_name=eDP-1
max_fps=60
chooser_cmd=slurp -f %o -or
chooser_type=simple

There might be a need to add this line on the last line of the config of river and the beginning of the line of the config on sway:

exec dbus-update-activation-environment DISPLAY I3SOCK SWAYSOCK WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=$nameofcompositor

This will make dbus read your env vars properly and also xdg-desktop-portal-wlr to work.
```
