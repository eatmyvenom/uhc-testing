# Use git to update the current directory to whatever the upstream is no matter what.

# Make sure that we arent developing here. If there are changes from HEAD then abort the update.
if [ -n "$(git status --porcelain)" ]; then
    echo "There are changes in the current directory. Aborting update."
    exit 1
fi

# Update the current directory to the upstream
git fetch
git pull
