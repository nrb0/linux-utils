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