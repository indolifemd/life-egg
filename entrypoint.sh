#!/bin/bash
# Cek jika git ada dan melakukan pull jika diatur untuk auto-update
if [[ -d .git ]] && [[ ${AUTO_UPDATE} == "1" ]]; then
  git pull
fi

# Install paket Node.js jika ada yang ditentukan
if [[ ! -z ${NODE_PACKAGES} ]]; then
  /usr/local/bin/npm install ${NODE_PACKAGES}
fi

# Uninstall paket Node.js jika ada yang ditentukan
if [[ ! -z ${UNNODE_PACKAGES} ]]; then
  /usr/local/bin/npm uninstall ${UNNODE_PACKAGES}
fi

# Install dependensi dari package.json jika ada
if [ -f /home/container/package.json ]; then
  /usr/local/bin/npm install
fi

# Perintah untuk menjalankan aplikasi
/usr/local/bin/${CMD_RUN}
