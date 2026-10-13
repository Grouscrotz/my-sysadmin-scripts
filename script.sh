#!/bin/bash

INTERVAL=10
LOG_FILE="monitor.log"

if ! touch "$LOG_FILE"; then
    echo "Ошибка: не удалось создать файл лога $LOG_FILE" >&2
    exit 1
fi

while true; do
    {
        echo "--- $(date '+%Y-%m-%d %H:%M:%S') ---"
        free -h
        df -h
        uptime
        echo
    } >> "$LOG_FILE"

    sleep "$INTERVAL"
done
