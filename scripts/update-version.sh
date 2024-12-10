#!/bin/bash

# Check arguments
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <new_version>"
  exit 1
fi

NEW_VERSION=$1
# REPO_FILE=$2
# CONFIG_FILE=$3

REPO_FILE=repository.yaml
CONFIG_FILE=microgreen-server/config.yaml

# Update repository.yaml
yq -i ".version = \"$NEW_VERSION\"" "$REPO_FILE"
yq -i ".\"add-ons\"[0].version = \"$NEW_VERSION\"" "$REPO_FILE"

# Update config.yaml
yq -i ".version = \"$NEW_VERSION\"" "$CONFIG_FILE"

echo "Updated version to $1"
