#!/bin/bash
./update.sh
exec java -Xms4G -Xmx8G -jar paper-1.8.8-445.jar nogui
