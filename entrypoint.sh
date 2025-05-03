#!/bin/bash
# entrypoint.sh
cd /home/container

# Ganti {{STARTUP}} dengan input dari panel
MODIFIED_STARTUP=$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g')

# Jalankan perintah
eval ${MODIFIED_STARTUP}
