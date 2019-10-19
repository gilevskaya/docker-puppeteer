FROM alpine:edge

RUN apk update && apk upgrade
# Installs latest Chromium package.
RUN apk add --no-cache \
  chromium \
  nss \
  freetype \
  freetype-dev \
  harfbuzz \
  ca-certificates \
  ttf-freefont \
  nodejs \
  yarn

# Tell Puppeteer to skip installing Chrome. We'll be using the installed package.
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

WORKDIR /app
COPY package.json yarn.lock ./
RUN set -ex && \
  yarn
COPY src ./src/

RUN apk add --no-cache bash

RUN apk add --no-cache \
  xvfb \
  x11vnc \
  openbox \
  xterm

EXPOSE 5900
COPY display.sh ./
RUN chmod +x display.sh

CMD ./display.sh