# Use git to update the current directory to whatever the upstream is no matter what.

# Make sure that we arent developing here. If there are changes from HEAD then abort the update.
# Get git status in a machine readable format and check if it is empty.

# If there is --force flag then force update the current directory to the upstream
if [ "$1" = "--force" ]; then
    git fetch
    git reset --hard origin/main
    ./uhc mode $(cat ./CURRENT_MODE)
    exit 0
fi

STATUS=$(git status --porcelain)

# Ignore certain files that are allowed to be changed
# Make sure this is compatible with grep -vE
IGNORE_FILES=$(cat ./scripts/IGNORE_FILES | tr '\n' '|')

STATUS=$(echo "$STATUS" | grep -vE "($IGNORE_FILES)")

if [ ! -z "$STATUS" ]; then
    echo "There are changes in the current directory. Aborting update."
    exit 1
fi

# Update the current directory to the upstream
git fetch

# If there are updates then pull them
if [ "$(git rev-list HEAD...origin/main --count)" != "0" ]; then
    git pull
    ./uhc mode $(cat ./CURRENT_MODE)
fi