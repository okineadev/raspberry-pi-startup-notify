#!/bin/bash

# Load Telegram functions and secrets
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=./tg_bot_api.sh
source "$SCRIPT_DIR/tg_bot_api.sh"

# Get current date and time
STARTUP_TIME=$(/usr/bin/date '+%Y-%m-%d %H:%M:%S')

# Get CPU temperature
# shellcheck disable=SC2196
CPU_TEMP=$(/usr/bin/vcgencmd measure_temp | /usr/bin/egrep -o '[0-9]*\.[0-9]*')

# Compose the message
MESSAGE="*Raspberry Pi started!*

• \`Time: $STARTUP_TIME\`
• \`CPU Temp: $CPU_TEMP°C\`"

# Send the message
send_tg_message "$TG_CHAT_ID" "$MESSAGE"
