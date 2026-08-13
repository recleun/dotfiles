#! /bin/bash

PLAYER="spotify"
FORMAT="{{ title }}"
NO_PLAYER="Spotify is not running"
PLAYERCTL_STATUS=$(playerctl --player=$PLAYER status 2>/dev/null)
EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
    STATUS=$PLAYERCTL_STATUS
else
    STATUS=$NO_PLAYER
fi

if [ "$STATUS" = "Stopped" ]; then
    echo "No music is playing"
elif [ "$STATUS" = "Paused"  ]; then
    playerctl --player=$PLAYER metadata --format "$FORMAT"
elif [ "$STATUS" = "$NO_PLAYER" ]; then
    echo "$STATUS"
else
    playerctl --player=$PLAYER metadata --format "$FORMAT"
fi
