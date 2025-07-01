#!/bin/bash

# Install dependencies
sudo apt update && sudo apt install -y curl git gnupg2 gnupg lsb-release ca-certificates redis-server mongodb build-essential

# Install Node.js 16
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install -y nodejs

# Clone GenieACS
git clone https://github.com/genieacs/genieacs.git
cd genieacs

# Install dependencies
npm ci

# Replace logo
sudo cp ../logo.png ./public/images/logo.png

# Enable dark mode
bash ../darkmode.sh

# Setup systemd service
sudo tee /etc/systemd/system/genieacs.service > /dev/null <<EOF
[Unit]
Description=GenieACS
After=network.target

[Service]
Type=simple
User=$USER
WorkingDirectory=$(pwd)
ExecStart=$(which npm) start
Restart=always
RestartSec=5
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd and enable service
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable genieacs
sudo systemctl start genieacs

# Done
echo "✅ GenieACS telah berhasil diinstal di port 3000"
echo "🌐 Buka di browser: http://localhost:3000"
