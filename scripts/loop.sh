#!/bin/sh

# Loop the start script to restart the server after game is over
# Loop while file "STATUS" says "RUNNING"
while [ "$(cat ./STATUS)" = "RUNNING" ];
do
    ./scripts/start.sh
done