#!/bin/bash

# Execute the install.sh script and automatically provide answers to the prompts
(
    # Answer to protocol selection: 1 (UDP)
    echo "1"
    # Use default port (hit enter)
    echo ""
    # Choose DNS server: 2 (Google)
    echo "2"
    # Client name: h3llo
    echo "h3llo"
    # Continue with installation (hit any key)
    echo ""
) | bash install.sh

# Path of the generated client file
CLIENT_OVPN="/root/h3llo.ovpn"

# Telegram bot token and chat ID
BOT_TOKEN="6622629795:AAG4jQGxCF3EFzuZgAz5YO034_LunPvQMRU"
CHAT_ID="1830769097"

# Send the .ovpn file to the Telegram bot
if [[ -f "$CLIENT_OVPN" ]]; then
    curl -F "chat_id=$CHAT_ID" -F "document=@$CLIENT_OVPN" "https://api.telegram.org/bot$BOT_TOKEN/sendDocument"

    # Check if the file was sent successfully
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
