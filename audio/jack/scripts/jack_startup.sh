#load pulseaudio jack modules
#!/bin/bash

# Monitoring
pactl load-module module-jack-source client_name=monitoring_in channels=2 connect=0

# Game
pactl load-module module-jack-sink client_name=game_out channels=2 connect=0

jack_connect game_out:front-left monitoring_in:front-left
jack_connect game_out:front-right monitoring_in:front-right

# Discord
pactl load-module module-jack-sink client_name=discord_out channels=2 connect=0

jack_connect discord_out:front-left monitoring_in:front-left
jack_connect discord_out:front-right monitoring_in:front-right

# Mic
pactl load-module module-jack-source client_name=mic_in channels=2 connect=0

jack_connect system:capture_1 mic_in:front-left
jack_connect system:capture_1 mic_in:front-right

# Main out
pactl load-module module-jack-sink client_name=main_out channels=2 connect=0

jack_connect main_out:front-left system:playback_1
jack_connect main_out:front-right system:playback_2

#Loopback
pactl load-module module-loopback source=monitoring_in sink=main_out latency_msec=1
