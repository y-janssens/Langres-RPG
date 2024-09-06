FROM rust:latest

RUN apt-get update && apt-get install -y \
    libgtk-3-dev \
    libatk1.0-dev \
    libcairo2-dev \
    libgdk-pixbuf2.0-dev \
    libpango1.0-dev \
    libsoup2.4-dev \
    libjavascriptcoregtk-4.0-dev \
    libwebkit2gtk-4.0-dev \
    pkg-config \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY ./src-tauri/Cargo.toml ./src-tauri/Cargo.lock .env ./

COPY . .
