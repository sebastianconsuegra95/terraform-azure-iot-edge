#!/bin/bash
set -e

# Verify jq
if ! command -v jq &>/dev/null; then
    sudo apt-get install jq -y
fi

create() {
    az iot edge set-modules --content "$MODULES_CONTENT_FILE" --device-id "$IOT_EDGE_DEVICE_NAME" --hub-name "$IOT_HUB_NAME" --resource-group "$RESOURCE_GROUP" --output none
    read
}

read() {
    az iot edge export-modules --device-id "$IOT_EDGE_DEVICE_NAME" --hub-name "$IOT_HUB_NAME" --resource-group "$RESOURCE_GROUP"
}

delete() {
    az iot edge set-modules --content "$EMPTY_CONTENT_FILE" --device-id "$IOT_EDGE_DEVICE_NAME" --hub-name "$IOT_HUB_NAME" --resource-group "$RESOURCE_GROUP"
}

# Check if the function exists (bash specific)
if declare -f "$1" >/dev/null; then
    # call arguments verbatim
    "$@"
else
    # Show a helpful error
    echo "'$1' is not a known function name" >&2
    exit 1
fi
