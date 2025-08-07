# 텍스트 편집기에 들어갈 내용

FROM n8nio/n8n:latest

USER root

### Install necessary packages
RUN apk update && \
    apk add --no-cache \
    chromium \
    harfbuzz \
    freetype \
    ttf-freefont \
    nss

### Set environment variables
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

USER node

### Install Puppeteer
RUN npm install puppeteer
