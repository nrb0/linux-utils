#!/bin/bash

# Games
pactl list short modules | grep "games_out" | cut -f1 | xargs -L1 pactl unload-module

# Coms
pactl list short modules | grep "coms_out" | cut -f1 | xargs -L1 pactl unload-module