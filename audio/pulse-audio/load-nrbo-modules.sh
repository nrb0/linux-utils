#!/bin/bash

# Games
pactl load-module module-null-sink sink_name='games_out' sink_properties=device.description='Games'

# Coms
pactl load-module module-null-sink sink_name='coms_out' sink_properties=device.description='Coms'

# Loopbacks
pactl load-module module-loopback source=coms_out.monitor latency_msec=1
pactl load-module module-loopback source=games_out.monitor latency_msec=1