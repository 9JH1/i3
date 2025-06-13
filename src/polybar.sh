source ~/.cache/wal/colors.sh
opacity="45"
background=$color0
background_transparent="#$opacity${background:1}"
background_alt=$color3
foreground=$color0
foreground_alt=$color2
border_color=$color4
primary=$color5
secondary=$color4
module_foreground=$color0
alert="#ff0000"
disabled=$color5
level0=$module_foreground
level1=$color2
level2=$color6
level3=$alert

read -r -d '' POLYBAR_CONFIG << EOM
[bar/bar_main]
border-left-size = 2pt
border-bottom-size = 2pt 
border-top-size = 2pt
border-right-size  = 2pt 
fixed-center = true
border-color = $border_color
modules-left = powermenu space seperator xworkspaces seperator polywins
modules-right = prefix playerctl_prev playerctl_ipc playerctl cava playerctl_next playerctl_seperator audio audio_seperator notify notify_seperator ram ram_seperator cpu cpu_seperator systray tray_seperator date
height = 3.2%
dpi=100
foreground = $foreground
font-4 = "Mononoki Nerd Font:style=Regular:size=18;3.2"
font-3 = "Mononoki Nerd Font:style=Regular:size=30;6.6"
font-2 = "Mononoki Nerd Font:style=Regular:size=16;2.1"
font-1 = "MonaspiceRN NFM:style=Bold:size=13;2.5"
font-0 = "Mononoki Nerd Font:style=Regular:size=13;2.1"
background=$background_transparent
enable-ipc=true
line-size = 2

[module/prefix]
type=custom/text
label = "%{T4}%{T-}"
format-background = $background_transparent
format-foreground = $color6

[module/playerctl_next]
type=custom/text
label = " %{T3}󰒭%{T-}"
click-left = playerctl next
format = " <label> "
format-background = $color6
format-foreground = $module_foreground

[module/playerctl_prev]
type=custom/text
label = "%{T3}󰒮"
click-left = playerctl previous
format = " <label> "
format-background = $color6
format-foreground = $module_foreground

[module/playerctl_ipc]
type = custom/ipc
hook-0 = echo "\$($HOME/.config/i3/src/playerctl_icon.sh) "
initial = 1
click-left = playerctl play-pause && polybar-msg action playerctl_ipc hook 0 > /dev/null
format ="<output>"
format-background = $color6
format-foreground = $module_foreground

[module/playerctl]
type=custom/script
exec = $HOME/.config/i3/src/playerctl.sh & polybar-msg action playerctl_ipc hook 0 > /dev/null
format ="%{T-}<label> "
interval=1
click-left = playerctl play-pause && polybar-msg action playerctl_ipc hook 0 > /dev/null
format-background = $color6
format-foreground = $module_foreground

[module/cava]
type=custom/script
exec=$HOME/.config/i3/src/cava.sh 
click-left = playerctl play-pause && polybar-msg action playerctl_ipc hook 0 >/dev/null 
format-background = $color6
format-foreground = $module_foreground
interval = 100000000000000
tail = true

[module/playerctl_seperator]
type=custom/text
label = "%{T4}%{T-}"
format = <label>
format-foreground=$color1
format-background=$color6

[module/audio]
type = internal/pulseaudio
format-volume = <ramp-volume><label-volume>
label-volume = "%percentage%% "
label-muted = "%{T3}󰖁 %{T-}"
format-muted-background=$color1
format-volume-background=$color1
format-muted-foreground = $module_foreground
format-volume-foreground=$module_foreground
ramp-volume-0 = "%{T3}󰕿 %{T-}"
ramp-volume-1 = "%{T3}󰖀 %{T-}"
ramp-volume-2 = "%{T3}󰕾 %{T-}"

[module/audio_seperator]
type=custom/text
label = "%{T4}%{T-}"
format = <label>
format-foreground=$color2
format-background=$color1

[module/notify]
type=custom/ipc 
hook-0 =echo "%{T3} %{T-}Notify %{T2}\$(~/.config/i3/src/notify.sh)%{T-} "
initial = 1 
format = <output>
click-left = "dunstctl set-paused toggle && polybar-msg action notify hook 0"
format-background = $color2
format-foreground = $module_foreground

[module/notify_seperator]
type=custom/text
label = "%{T4}%{T-}"
format = <label>
format-foreground=$color3
format-background=$color2

[module/ram]
type=internal/memory
interval=5
warn-percentage=95 
label = %percentage_used%%
format = "%{T3}  %{T-}<label> <ramp-used> "
format-background = $color3
format-foreground = $module_foreground
label-warn = !%free% left
format-warn = " %{T3} %{T-}<label-warn> <label-warn>"
ramp-used-foreground-0 = $level0
ramp-used-foreground-1 = $level1
ramp-used-foreground-2 = $level2
ramp-used-foreground-3 = $level3
format-warn-foreground= $alert
format-warn-background = $color5
ramp-used-0 = ▁
ramp-used-1 = ▂
ramp-used-2 = ▃
ramp-used-3 = ▄
ramp-used-4 = ▅
ramp-used-5 = ▆
ramp-used-6 = ▇
ramp-used-7 = █
bar-used-width = 10
bar-used-empty-foreground = $color8

[module/ram_seperator]
type=custom/text
label = "%{T4}%{T-}"
format = <label>
format-foreground=$color4
format-background=$color3

[module/cpu]
type=internal/cpu
interval = 5
warn-percentage = 95
label-warn = "!%percentage% "
format-warn = "%{T3} %{T-}<label-warn> <ramp-load> "
format-background = $color4
format-foreground = $module_foreground
format-warn-foreground = $alert
format-warn-background = $color4
label = "%percentage%%"
format = "%{T3} %{T-}<label> <ramp-load> "
ramp-load-spacing = 0
ramp-load-0 = ▁
ramp-load-1 = ▂
ramp-load-2 = ▃
ramp-load-3 = ▄
ramp-load-4 = ▅
ramp-load-5 = ▆
ramp-load-6 = ▇
ramp-load-7 = █

[module/cpu_temp]
type = custom/script
interval = 5
exec = echo " $(sensors | grep "Package id 0:" | tr -d '+' | awk '{print $4}' | cut -d'.' -f1 )󰔄 "
format-background = $color4
format-foreground = $module_foreground

[module/cpu_seperator]
type=custom/text
label = "%{T4}%{T-}"
format = <label>
format-foreground=$color5
format-background=$color4

[module/systray]
type = internal/tray
tray-spacing = 4pt
tray-size = 20
format-background = $color5
tray-background= $color5
format-foreground = $module_foreground
tray-foreground = $module_foreground

[module/tray_seperator]
type=custom/text
label = "%{T4}%{T-}"
format = <label>
format-foreground=$color6
format-background=$color5

[module/date]
type = internal/date
interval = 1
format-foreground = $module_foreground
format-background = $color6
date = "%{T3}󰃭 %{T-}%{T2}%A, %l:%M %p %{T-}"
date-alt = %d/%m/%Y

[module/date_suffix]
type=custom/text
label = " "
format-background=$color6

[module/xworkspaces]
type = internal/xworkspaces
label-active = %{T2}%name%%icon%%{T-}
label-active-padding = 1
label-active-foreground = $foreground-alt
label-active-underline = $primary
label-occupied = %name%%icon%
label-occupied-padding = 1
label-urgent = %name%%icon%
label-urgent-underline = $alert
label-urgent-padding = 1
label-empty = %name%%icon%
label-empty-padding = 1
label-visible = %name%%icon%
workspace-count = 10

[module/space]
type = custom/text
content = " "
[module/seperator]
type = custom/text
format = <label>
format-foreground = $background-alt
label = "%{T2} | %{T-}"

[module/polywins]
type = custom/script
exec = /home/$USER/.config/i3/src/window.sh 2>/dev/null
format = <label>
label = "%{T2}%output%%{T-}"  
label-padding = 1
tail = true
overflow = hidden

[module/powermenu]
type = custom/text
#label  = "  "
label = "  "
format = %{T5}<label>%{T-}
click-left = ~/.config/i3/src/jgmenu.sh
EOM

POLYBAR_CONFIG_PATH="/home/$USER/.config/i3/conf/polybar.ini"
echo "$POLYBAR_CONFIG" > "$POLYBAR_CONFIG_PATH"
polybar -c "$POLYBAR_CONFIG_PATH" bar_main
