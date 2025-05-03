#!/bin/bash
cd /home/container

# Clone Git jika GIT_ADDRESS diisi
if [[ -n "${GIT_ADDRESS}" ]]; then
    echo "Cloning from $GIT_ADDRESS..."
    rm -rf ./*
    git clone --branch ${BRANCH:-main} https://${USERNAME}:${ACCESS_TOKEN}@${GIT_ADDRESS#https://} .
fi

# Auto update dari repo jika ada folder .git
if [[ -d .git ]] && [[ "$AUTO_UPDATE" == "1" ]]; then
    echo "Auto updating repo..."
    git pull
fi

# Install / uninstall manual packages jika ada
if [[ -n "$NODE_PACKAGES" ]]; then
    echo "Installing node packages: $NODE_PACKAGES"
    npm install $NODE_PACKAGES
fi

if [[ -n "$UNNODE_PACKAGES" ]]; then
    echo "Uninstalling node packages: $UNNODE_PACKAGES"
    npm uninstall $UNNODE_PACKAGES
fi

# Install dari package.json
if [[ -f package.json ]]; then
    echo "Installing dependencies from package.json"
    npm install
fi

# Jalankan aplikasi
if [[ -n "$CMD_RUN" ]]; then
    echo "Starting with CMD_RUN: $CMD_RUN"
    exec $CMD_RUN
elif [[ -n "$CMD_RIN" ]]; then
    echo "Starting with PM2: $CMD_RIN"
    exec pm2 start $CMD_RIN
else
    echo "No startup command provided (CMD_RUN or CMD_RIN). Exiting."
    exit 1
fi
