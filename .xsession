# Set Environment Variables
export MOZ_USE_XINPUT2=1
export MOZ_ACCELERATED=1
export ENV=$HOME/.kshrc
export MOZ_WEBRENDER=1
export SDL_VIDEO_X11_DGAMOUSE=0
export QT_QPA_PLATFORMTHEME=gtk2

# Libreoffice laggy on scrolling this variable fixes
export SAL_USE_VCLPLUGIN=gen

# Set Locale
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

# Set go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin

# Set Autoconf & Automake
export AUTOCONF_VERSION=2.69
export AUTOMAKE_VERSION=1.16

# Disable Bell
xset b off

# Set fff
export FFF_TRASH_CMD="rm -rf"
export FFF_KEY_BULK_RENAME_ALL="off"


# Start DBus
export $(dbus-launch --exit-with-x11)

# Disable core dumps
ulimit -Sc 0

# load Xresources file
xrdb -merge $HOME/.Xresources

# Set wallpaper
feh --bg-fill /home/user/OpenBSD.png

# Xidle
xidle -delay 5 -nw -program "/usr/X11R6/bin/xlock -dpmsstandby 5" -timeout 1800 &

# Launch dunst (Notifications)
exec dunst &

# Launch tint2
exec tint2 &

# Launch WM
exec cwm
