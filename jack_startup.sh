#load pulseaudio jack modules
#!/bin/bash

# Spotify
pactl load-module module-jack-sink sink_name=spotify_out client_name=spotify_out channels=2 connect=0
pactl load-module module-jack-source client_name=spotify_in channels=2 connect=0

jack_connect spotify_out:front-left spotify_in:front-left
jack_connect spotify_out:front-right spotify_in:front-right

jack_connect spotify_out:front-left system:playback_1
jack_connect spotify_out:front-right system:playback_2

# Game
pactl load-module module-jack-sink client_name=game_out channels=2 connect=0
pactl load-module module-jack-source client_name=game_in channels=2 connect=0

jack_connect game_out:front-left game_in:front-left
jack_connect game_out:front-right game_in:front-right

jack_connect game_out:front-left system:playback_1
jack_connect game_out:front-right system:playback_2

# Discord
pactl load-module module-jack-sink client_name=discord_out channels=2 connect=0
pactl load-module module-jack-source client_name=discord_in channels=2 connect=0

jack_connect discord_out:front-left discord_in:front-left
jack_connect discord_out:front-right discord_in:front-right

jack_connect discord_out:front-left system:playback_1
jack_connect discord_out:front-right system:playback_2

# OBS Monitoring
pactl load-module module-jack-sink client_name=obs_out channels=2 connect=0

jack_connect obs_out:front-left system:playback_1
jack_connect obs_out:front-right system:playback_2

# Input Card
jack_connect system:capture_1 game_in:front-left
jack_connect system:capture_2 game_in:front-right

jack_connect system:capture_1 system:playback_1
jack_connect system:capture_2 system:playback_2