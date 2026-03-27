#!/bin/bash

set -e

echo "Installing Syncthing..."

# Install Syncthing
# curl -s https://syncthing.net/release-key.txt | gpg --dearmor | sudo tee /usr/share/keyrings/syncthing.gpg > /dev/null

# echo "deb [signed-by=/usr/share/keyrings/syncthing.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list

sudo apt update
sudo apt install -y syncthing

echo "Generating initial config..."

# Start once to generate config
syncthing --no-browser &
sleep 5
pkill syncthing

CONFIG="$HOME/.local/state/syncthing/config.xml"

echo "Updating config at $CONFIG..."

# Replace address
sed -i 's|127.0.0.1:8384|0.0.0.0:8384|' "$CONFIG"

# Add insecureAdminAccess if not present
grep -q "insecureAdminAccess" "$CONFIG" || \
  sed -i 's|</gui>|<insecureAdminAccess>true</insecureAdminAccess></gui>|' "$CONFIG"

echo "Setup complete!"
