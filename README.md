# i3 .files
> This repo is my daily driver and is updated frequently keep that in mind when cloning.
---
### Desktop:
[Tiling and window animations (Hypr like)](/img/tiling.mp4)
![neovim & firefox](/img/nvim-firefox.png)
![neovim & firefox](/img/nvim-firefox-alt.png)
![neovim & firefox](/img/nvim-firefox-alt-2.png)
![rofi](/img/rofi.png)
![dunst](/img/dunst.png)
> neovim config can be found [here](https://github.com/9JH1/nvim)
### Terminal:
everything is styled using pywal
![alacritty](/img/alacritty.png)
![neovim](/img/neovim.png)
![htop](/img/htop.png)
| Command | Description | 
|-|-|
| `n` | shorthand for neovim |
| `cdd` | cd to last used directory (useful in tmux) |
| `ccat` | cat file with pygmentize | 
| `cdr` | cd into random subdir |
---
# Features:
### Keybinds:
|Binding|Description|
|-|-|
| `$mod+Shift+f` | toggles global fullscreen ( fullscreen program over ALL monitors) | 
| `$mod+a` | clean workspaces by ordering in numerical order.|
| `$mod+Shift+q`| Force quit focused window |
| `$mod+z` | activate boomer (desktop zoom)| 
| `$mod+r` | execute Rofi|
| `$mod+Shift+s | screenshot, this not only lets you make a selection to clipboard but it also saves a full resolution copy of your entire desktop ( all monitors ) and saves it to `~/Pictures/screenshots`|
| `$mod+x` | lock screen |
| `$mod+d` | execute dmenu, useful for if rofi is broken or if you are a keybind veteran and used to `$mod+d` opening your launcher |
| `$mod+b`| toggles alacritty between 40px window padding and 0px window padding|
| `$mod+Shift+b` | Toggles alacritty between 0.7 opacity and 1 opacity |

## Installation
Ensure that you have the yay package manager installed before running the install script.
```bash
git clone https://github.com/9jh1/i3
cd i3
./install.sh
```
aditionally install `python-pywalfox` for using pywal colors in firefox.
> This config was written for Arch, if you are using another distro it is up to you to re-write broken scripts.
