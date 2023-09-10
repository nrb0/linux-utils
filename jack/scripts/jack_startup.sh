#load pulseaudio jack modules
#!/bin/bash

# Game
pactl load-module module-jack-sink client_name=game_out channels=2 connect=0

jack_connect game_out:front-left system:playback_1
jack_connect game_out:front-right system:playback_2

# Discord
pactl load-module module-jack-sink client_name=discord_out channels=2 connect=0

jack_connect discord_out:front-left system:playback_1
jack_connect discord_out:front-right system:playback_2

# Mic
pactl load-module module-jack-source client_name=mic_in channels=2 connect=0

jack_connect system:capture_1 mic_in:front-left
jack_connect system:capture_1 mic_in:front-right

# Loopback (for bluetooth)
pactl load-module module-jack-source client_name=jack_loopback channels=2 connect=0

jack_connect jack_loopback:front-left game_out:front-left
jack_connect jack_loopback:front-right game_out:front-right
jack_connect jack_loopback:front-left discord_out:front-left
jack_connect jack_loopback:front-right discord_out:front-right

pactl load-module module-loopback latency_msec=1

# DAW
pactl load-module module-jack-source client_name=daw_out channels=2 connect=0
