#!/bin/sh
set -eu

CONFIG_FILE="/mosquitto/config/mosquitto.conf"
PASSWORD_FILE="/mosquitto/config/passwordfile"

ensure_line() {
    line="$1"
    if ! grep -Eq "^${line}$" "$CONFIG_FILE"; then
        printf "\n%s\n" "$line" >> "$CONFIG_FILE"
    fi
}

if [ -n "${MQTT_USER:-}" ] && [ -n "${MQTT_PASS:-}" ]; then
    mosquitto_passwd -b -c "$PASSWORD_FILE" "$MQTT_USER" "$MQTT_PASS"
    ensure_line "allow_anonymous false"
    ensure_line "password_file ${PASSWORD_FILE}"
    echo "Configured MQTT password authentication for user: ${MQTT_USER}"
else
    echo "MQTT_USER or MQTT_PASS not set; broker allows anonymous access"
fi

exec "$@"
