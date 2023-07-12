# Set Environment Variables
export MOZ_USE_XINPUT2=1
export MOZ_ACCELERATED=1
export ENV=$HOME/.kshrc
export MOZ_WEBRENDER=1

# Set Locale
export LC_ALL="en_US.UTF-8"

# Set java
export PATH=$PATH:/usr/local/jdk-17/bin

# Set Autoconf & Automake
export AUTOCONF_VERSION=2.69
export AUTOMAKE_VERSION=1.16

# Disable Display Power Management
xset -dpms
setterm -blank 0 -powerdown 0

# Disable Screensaver
xset s off

# Disable Bell
xset b off

# load Xresources file
xrdb -merge $HOME/.Xresources

# Set wallpaper
feh --bg-fill /home/user/OpenBSD.png

# Launch dunst (Notifications)
dunst &

# Launch tint2
exec tint2 &

# Launch WM
exec cwm
