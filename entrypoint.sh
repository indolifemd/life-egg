#!/bin/bash
cd /home/container

MODIFIED_CMD=$(echo "${CMD_RUN}" | sed -e 's/\\$//g')

if [[ -d .git ]] && [[ "$AUTO_UPDATE" == "1" ]]; then
    git pull
fi

if [[ ! -z "$NODE_PACKAGES" ]]; then
    npm install $NODE_PACKAGES
fi

if [[ ! -z "$UNNODE_PACKAGES" ]]; then
    npm uninstall $UNNODE_PACKAGES
fi

if [[ -f package.json ]]; then
    npm install
fi

exec $MODIFIED_CMD
