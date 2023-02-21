# Set Environment Variables
export MOZ_USE_XINPUT2=1
export MOZ_ACCELERATED=1
export ENV=$HOME/.kshrc
export MOZ_WEBRENDER=1

# Set Locale
export LC_ALL="en_US.UTF-8"

# Disable Display Power Management
xset -dpms
setterm -blank 0 -powerdown 0

# Disable Screensaver
xset s off

# Disable Bell
sxet b 0 0 0

# Launch DBus
if [ -x /usr/local/bin/dbus-launch -a -z "${DBUS_SESSION_BUS_ADDRESS}" ]; then
	eval `dbus-launch --sh-syntax --exit-with-x11`
fi

# Set wallpaper
feh --bg-fill /home/user/OpenBSD.png

# Launch dunst (Notifications)
dunst &

# Launch tint2
exec tint2 &

# Launch WM
exec cwm
