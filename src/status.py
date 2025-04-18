#!/usr/bin/env python
import dbus
try:
    session_bus = dbus.SessionBus()
    spotify_bus = session_bus.get_object(
        'org.mpris.MediaPlayer2.spotify',
        '/org/mpris/MediaPlayer2'
    )
    spotify_properties = dbus.Interface(
        spotify_bus,
        'org.freedesktop.DBus.Properties'
    )
    status = spotify_properties.Get('org.mpris.MediaPlayer2.Player', 'PlaybackStatus')
    if status == "Paused":
        print("")
    else:
        print("")
except Exception as e:
    print("",end="")
