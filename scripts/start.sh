#!/bin/bash

DEFAULT_PORT=25565
# Check if the file exists
if [ -f "./PORT" ]; then
    # File exists, read the file
    PORT=$(cat "./PORT")
else
    # File does not exist, use the default value
    PORT="$DEFAULT_PORT"
fi

# Use the JAVA environment variable if it is set otherwise use "java"
JAVA=${JAVA:-java}

exec $JAVA -Xms4G -Xmx8G -jar paper-1.8.8-445.jar -p $PORT
