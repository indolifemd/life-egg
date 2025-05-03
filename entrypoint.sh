#!/bin/bash
cd /home/container

# Ganti placeholder dengan nilai environment
MODIFIED_STARTUP=$(echo -e "${STARTUP}" | sed -e 's/{{[A-Z_][A-Z0-9_]*}}/${\1}/g')

# Clone repo jika alamat GIT disediakan
if [[ -n "${GIT_ADDRESS}" ]]; then
    echo -e "[IndoLife] Cloning repo dari ${GIT_ADDRESS}"
    
    if [[ -d .git ]]; then
        echo -e "[IndoLife] Repo sudah ada, skip clone"
    else
        if [[ -n "${USERNAME}" && -n "${ACCESS_TOKEN}" ]]; then
            GIT_ADDRESS=$(echo "${GIT_ADDRESS}" | sed -e "s#https://#https://${USERNAME}:${ACCESS_TOKEN}@#")
        fi

        BRANCH="${BRANCH:-main}"
        echo -e "[IndoLife] Checkout branch: ${BRANCH}"
        git clone --single-branch --branch ${BRANCH} ${GIT_ADDRESS} .
    fi
fi

# Jalankan perintah startup
echo -e "[IndoLife] Menjalankan perintah startup:"
echo -e "$MODIFIED_STARTUP"

eval "$MODIFIED_STARTUP"
