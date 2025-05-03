# Base image untuk Node.js 20
FROM node:20-bullseye-slim

# Install dependensi untuk Puppeteer dan Node.js
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
    --no-install-recommends \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

# Tentukan direktori kerja di dalam container
WORKDIR /home/container

# Salin seluruh file proyek ke dalam container
COPY . .

# Install dependensi Node.js
RUN npm install

# Perintah untuk menjalankan aplikasi
CMD ["npm", "start"]
