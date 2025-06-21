"""hide bar_bottom when an app is fullscreened"""
from os import system, popen
import i3ipc

FULLSCREEN_STATE = False

ON_FULLSCREEN_TRUE = "/home/$USER/.config/i3/src/kill_polybar_dock.sh"
ON_FULLSCREEN_FALSE = "/home/$USER/.config/i3/src/polybar.sh --dockonly"

try:
    PRIMARY_DISPLAY = popen("xrandr | grep \"primary\" | awk '{print $1}'") \
            .read() \
            .replace("\n", "")

    i3 = i3ipc.Connection()

    def get_monitor_for_window(window):
        """return monitor of window"""
        win_x = window.rect.x
        win_y = window.rect.y

        for output in i3.get_outputs():
            if not output.active:
                continue
            ox = output.rect.x
            oy = output.rect.y
            ow = output.rect.width
            oh = output.rect.height

            if ox <= win_x < ox + ow and oy <= win_y < oy + oh:
                return output.name
        return None


    def on_window_event(i3, event):
        """run when a window state is changed"""
        global FULLSCREEN_STATE
        if event.change == 'fullscreen_mode':
            window = event.container
            monitor = get_monitor_for_window(window)
            if monitor == PRIMARY_DISPLAY:
                if window.fullscreen_mode:
                    if not FULLSCREEN_STATE:
                        print("Window entered fullscreen")
                        system(ON_FULLSCREEN_TRUE)

                        FULLSCREEN_STATE = True
                else:
                    if FULLSCREEN_STATE:
                        print("Window exited fullscreen")
                        system(ON_FULLSCREEN_FALSE)
                        FULLSCREEN_STATE = False
    i3.on('window', on_window_event)
    i3.main()
except:
    print("closing")
