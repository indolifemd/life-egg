# Base image Node.js 20
FROM node:20-bullseye

# Install Puppeteer (jika perlu) dan dependensi tambahan
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
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory (Pterodactyl expects this)
WORKDIR /home/container

# Copy package files only first
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Copy all project files
COPY . .

# Entry point (Egg akan menimpa ini dengan `{{STARTUP}}`)
CMD ["bash", "entrypoint.sh"]
