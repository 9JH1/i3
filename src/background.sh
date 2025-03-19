#feh --bg-fill --no-xinerama --randomize "/drive/SteamLibrary/steamapps/compatdata/244210/pfx/drive_c/users/steamuser/Documents/Assetto Corsa/screens/best";	
bg="$(cat ~/.fehbg | grep -oP "'\K[^']+(?=')")"  #"$(ls -t /drive/SteamLibrary/steamapps/compatdata/244210/pfx/drive_c/users/steamuser/Documents/Assetto\ Corsa/screens/best/*.* 2>/dev/null | head -n 1)"
echo $bg
wal -i "$bg" -n
feh --bg-fill --no-xinerama "$bg" &
wal -R -n -q -s