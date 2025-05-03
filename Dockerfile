FROM node:20-bullseye-slim

RUN apt-get update && apt-get install -y \
  libatk-bridge2.0-0 \
  libatk1.0-0 \
  libcups2 \
  libdrm2 \
  libxcomposite1 \
  libxdamage1 \
  libxrandr2 \
  libgbm1 \
  libasound2 \
  libpangocairo-1.0-0 \
  libpango-1.0-0 \
  libx11-xcb1 \
  libxcb1 \
  libxext6 \
  libxfixes3 \
  libnss3 \
  libx11-6 \
  libxrender1 \
  libjpeg62-turbo \
  libgtk-3-0 \
  fonts-liberation \
  libappindicator3-1 \
  lsb-release \
  xdg-utils \
  wget \
  ca-certificates \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD [ "/bin/bash", "/entrypoint.sh" ]


#IndoLife
