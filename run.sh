#!/bin/sh

OPTIONS="/data/options.json"

TV=$(jq -r '.tv' "$OPTIONS")
NAME=$(jq -r '.name' "$OPTIONS")
MQTT_HOST=$(jq -r '.mqtt_host' "$OPTIONS")
MQTT_PORT=$(jq -r '.mqtt_port' "$OPTIONS")
MQTT_USER=$(jq -r '.mqtt_user' "$OPTIONS")
MQTT_PASS=$(jq -r '.mqtt_password' "$OPTIONS")

# URL-encode the password to handle special characters
MQTT_PASS_ENCODED=$(python3 -c "import urllib.parse, sys; print(urllib.parse.quote(sys.argv[1], safe=''))" "$MQTT_PASS" 2>/dev/null || \
    node -e "process.stdout.write(encodeURIComponent(process.argv[1]))" "$MQTT_PASS")

if [ -n "$MQTT_USER" ]; then
    MQTT_URL="mqtt://${MQTT_USER}:${MQTT_PASS_ENCODED}@${MQTT_HOST}:${MQTT_PORT}"
else
    MQTT_URL="mqtt://${MQTT_HOST}:${MQTT_PORT}"
fi

export LGTV_TV="$TV"
export LGTV_NAME="$NAME"
export LGTV_URL="$MQTT_URL"

exec node /app/index.js
