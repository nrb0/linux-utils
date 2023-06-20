# Disable loopback
pactl list short modules | grep "module-loopback" | cut -f1 | xargs -L1 pactl unload-module

# Kill jack
killall jackd