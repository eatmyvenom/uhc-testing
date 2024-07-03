# Use git to update the current directory to whatever the upstream is no matter what.

# Make sure that we arent developing here. If there are changes from HEAD then abort the update.
# Get git status in a machine readable format and check if it is empty.

STATUS=$(git status --porcelain)

# Ignore the files "server.properties", "paper.yml", "bukkit.yml", "STATUS", "plugins/UhcCore/storage.yml", "plugins/UhcCore/config.yml", and "spigot.yml" as they are modified by the server.

STATUS=$(echo "$STATUS" | grep -v "server.properties" | grep -v "paper.yml" | grep -v "bukkit.yml" | grep -v "STATUS" | grep -v "plugins/UhcCore/storage.yml" | grep -v "plugins/UhcCore/config.yml" | grep -v "spigot.yml")

if [ ! -z "$STATUS" ]; then
    echo "There are changes in the current directory. Aborting update."
    exit 1
fi

# Update the current directory to the upstream
git fetch

# If there are updates then pull them
if [ "$(git rev-list HEAD...origin/master --count)" != "0" ]; then
    git pull
    echo "Updated to the latest version."
    
    # Restore mode to whatever it was before the update overwrote it
    ./uhc mode $(cat ./CURRENT_MODE)
fi