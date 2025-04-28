# i3 .files
> this repo is my daily driver and is updated frequently keep that in mind when cloning.
## Features
### Desktop:
this repo now contains WINDOW ANIMATIONS and WINDOW TILING similar to hyprland This config uses pywal to theme all of its UI, this includes Polybar, Rofi, Dunst, Alacritty, Zsh, Tmux and more. This repo includes autostarting bluetooth and network applets along with a rich information theme on polybar. Multiple monitors are supported where the background is set to a solid color for all non-primary displays. this color is taken from the current background so everything still aligns with the theme. Here is a list of keybinds that I've added, these are only keybinds of significance that way I dont have to write a long list of keybinds :D :
|Keybind|Description|
|-|-|
| `$mod+Shift+f` | toggles global fullscreen ( fullscreen program over ALL monitors) | 
| `$mod+a` | clean workspaces by ordering in numerical order. ![unclean](/img/image%20copy%202.png) ![clean](/img/image%20copy%206.png)|
| `$mod+Shift+q`| Force quit focused window |
| `$mod+z` | activate boomer (desktop zoom)| 
| `$mod+r` | execute Rofi|
| `$mod+Shift+s | screenshot, this not only lets you make a selection to clipboard but it also saves a full resolution copy of your entire desktop ( all monitors ) and saves it to `~/Pictures/screenshots`|
| `$mod+x` | lock screen |
| `$mod+d` | execute dmenu, useful for if rofi is broken or if you are a keybind veteran and used to `$mod+d` opening your launcher |

![desktop](/img/image%20copy%207.png)
![rofi](/img/image%20copy%204.png)
![alternate background](/img/image%20copy%205.png)
![neovim](/img/image%20copy%203.png)
> neovim config can be found [here](https://github.com/9jh1/nvim)
---

### Terminal:
![greeter](/img/image%20copy.png)
The terminal used is Alacritty, Tmux runs nested in alacritty with ZSH as the shell, the zsh prompt was generated using P10K with Z4H installer. the greeter is Fastfetch which is colored and animated using lolcat, the zsh prompt is also hidden until the user presses a key. there are some custom keybinds for alacritty built into the window manager:
|Keybind|Description|
|-|-|
| `$mod+b`| toggles alacritty between 40px window padding and 0px window padding|
| `$mod+Shift+b` | Toggles alacritty between 0.7 opacity and 1 opacity |
---
## Installation
#### 1. the following are required for all scripts to work;
- rofi
- feh 
- nitrogen
- lolcat
- boomer
- playerctl
- i3wm
- betterlockscreen
- dunst
- rofi
- picom (arian8j2 fork)
- polybar
- fastfetch
- wmctrl
- maim 
- xclip
- xrandr
- python-i3ipc
- dbus
- alacritty 
- zsh
- alttab
- snixembed
- nm-applet
- blueman-applet
- unclutter
- conky
- pywal
- tmux
> These dependancys can be culled by going through the `/src` folder and removing the configurations you dont want
###
#### 2. Make sure you make a backup of your current .files located in `$HOME/.config/i3`.
#### 3. clone this repo:
```bash
cd ~.config
git clone https://github.com/9jh1/i3
```
#### 4. reload I3, by default this is done by Ctrl+Shift+R, or open a terminal and write 

```bash
i3msg reload
```
> This config was written for Arch, if you are using another distro it is up to you to re-write broken scripts.
