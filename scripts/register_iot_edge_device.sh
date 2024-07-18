#!/bin/bash
set -e

create() {
    az iot hub device-identity create --device-id "$IOT_EDGE_DEVICE_NAME" --edge-enabled --hub-name "$IOT_HUB_NAME" --resource-group "$RESOURCE_GROUP" --output none
    read
}

read() {
    az iot hub device-identity connection-string show --device-id "$IOT_EDGE_DEVICE_NAME" --hub-name "$IOT_HUB_NAME" --resource-group "$RESOURCE_GROUP"
}

delete() {
    az iot hub device-identity delete --device-id "$IOT_EDGE_DEVICE_NAME" --hub-name "$IOT_HUB_NAME" --resource-group "$RESOURCE_GROUP"
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