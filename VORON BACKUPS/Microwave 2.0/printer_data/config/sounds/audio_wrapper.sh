#!/bin/bash

# Export essential audio environment variables
export XDG_RUNTIME_DIR=/run/user/1000

# Try to play the sound and capture any output
aplay "$1"