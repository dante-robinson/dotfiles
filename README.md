## Originally Forked From

#### Author Luca CPZ

#### License BY-NC-SA\_

#### Source https://github.com/lcpz/awesome-copycats

## Description

UPDATE - OUTDATED DOTFILES CURRENT DOTFILES - https://github.com/dante-robinson/SwayWM-dotfiles

This forked repository is based on the PowerArrow-Dark theme from the source mentioned above and has been cut down significantly. I have remove many of the keybinds because I personally do not use most of them as well as deleted all the not used themes and widgets, then I added a few more widgets from the sources you can find at the bottom of the page. The repository is a mixture of code from myself, <a href=https://github.com/lcpz> lcpz</a> and <a href=https://github.com/streetturtle>streetturtle</a>. All notifications have been removed as well as mail integration as I don't like having potentially harmful emails cached to my drive. The WM has been locked in floating only mode as I dont use tiling at all at this time. Freedesktop menu has been changed to rofi as some of my apps were hidden through that menu.

## Features

- Autostart windowless processes
- Fast volume shortcuts
- Calendar with current day highlighted and months switch with a click/scroll
- OpenWeatherMap integration
- Symbolic tag names
- DWM-like textual layoutbox
- Cairo wibar
- Dynamic tagging

## Screenshots

<img title="Screenshot" alt="Desktop" src="Desktop.png">

## Installation

```
git clone -b AwesomeWM-Arch  https://github.com/dante-robinson/dotfiles.git && cd dotfiles && mv -f .*  -t ~
```

## Usage

The modular structure allows you to define startup processes and change keybindings in `rc.lua` and also configure widgets in `theme.lua`.

You can enter the directory by running

`sudo nano ~/.config/awesome/rc.lua`

and you can change the keybindings in that find by scrolling down to the key bindings section and you can define startup apps in this file to by going up near the top under the XDG autostart section.

If your looking to remove a widget you can run

`sudo nano ~/.config/awesome/themes/theme.lua`

then scroll down to the bottom and inside Right Widgets object just delete out the widgets you dont want like for example battery remove the battery_widget(), (note the comma at the end as well) then after saving the file you can refresh awesome by running Control + Super + R.

## Setup

You will need to go to <a href=https://openweathermap.org/>OpenWeather</a> and sign up and make an API Key. After you have your API Key would will need to run

`sudo nano ~/.config/awesome/themes/theme.lua`

and go to the bottom of the file inside the Right Widgets object theres an item called weather_widget that contains another object with 2 variables inside. The first variable is called api_key and that is where you will place your API Key inside "" where the current not working key exists. The second variable is coordinates this is where you input some coordinates you want the weather to be gather from this is very simple by just looking up your city or a city around you with the word Coordinates after it such as "Toronto Coordinates" which is the default that is setup right now. The first coordinate is longitude and the second is latitude.

The wallpaper can be changed by replacing

`~/.config/awesome/themes/wall.png`

and then refreshing awesome by running Control + Super + R.

You will need the following packages to use the WM Config out of the box without changing much

`pamixer arc-icon-theme kitty xbacklight rofi flameshot feh lm_sensors acpi`

## Commands/Shortcuts

Note the Super key I am referring to is the Windows Key

<b>Super + Mouse Button 1 (Left Click) -</b> Move windows around<br>
<b>Super + Mouse Button 3 (Right Click) -</b> Resize window<br>
<b>Control + Super + R -</b> Restart AwesomeWM<br>
<b>Super + F -</b> Put app in Fullscreen and undo Fullscreen<br>
<b>Super + M -</b> Maximize app and undo Maximize<br>
<b>Super + N -</b> Minimize app<br>
<b>Control + Super + N -</b> Unminimize App<br>
<b>Super + Q -</b> Kill app<br>
<b>Alt + Control + L -</b> Lock screen<br>
<b>Alt + M -</b> Toggle Mute<br>
<b>Alt + Up Arrow -</b> Increase volume by 5% (Can be changed in rc.lua)<br>
<b>Alt + Down Arrow -</b> Decrease volume by 5% (Can be changed in rc.lua)<br>
<b>Super + W -</b> Launch rofi<br>
<b>Super + Enter -</b> Launch a kitty terminal<br>
<b>Super + R -</b> Run prompt in wibar (press Escape to exit)<br>
<b>Super + Number -</b> Change to that Workspace Number so 5 would bring to Workspace 5<br>
<b>Super + Left/Right Arrow -</b> Change between the next and previous workspace<br>

## Extra dotfiles (Firefox Atom and zsh)

The neovim config is based on ecovim and contains my personal tweaks to it nothing crazy. As for the Firefox config this is a pretty extreme user.js config with a bunch of extensions for added security as well as to use my crypto hardware wallets. If you do use the .mozilla folder you will visit many sites that will not work without having javascript enabled and you will need to enable those sites to be allowed to run javascript through the noScript extension. For most websites they will have alot of javascript from many providers you don't need to enable them all usually for basic functionality. You can make sure the browser config is working correctly by visiting http://browserleaks.com and checking to make sure WebRTC, WebGL and stuff like that is all disabled javascript is enabled through noScript if you want to test those leaks. Location data will depend on your own DNS setup and both the Font and Canvas fingerprinting should be randomized on each refresh. To change your shell to zsh you can run this command

`chsh -s /bin/zsh`

## Additional stuff

#### BY-NC-SA: http://creativecommons.org/licenses/by-nc-sa/4.0

#### Awesome: http://github.com/awesomeWM/awesome

#### branches: https://github.com/lcpz/awesome-copycats/branches

#### lain: https://github.com/lcpz/lain

#### MIT License for streetturtle widgets: https://choosealicense.com/licenses/mit/

#### Ubuntu: https://wiki.ubuntu.com/Fonts#Enabling_Bitmapped_Fonts

#### pyllyukko user.js template used: https://github.com/pyllyukko/user.js/
