FROM rust:latest

RUN apt-get update && apt-get install -y \
    libwebkit2gtk-4.1-dev \
    libgtk-3-dev \
    libayatana-appindicator3-dev \
    libjavascriptcoregtk-4.1-dev \
    librsvg2-dev \
    build-essential \
    libsoup-3.0-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /code

RUN cargo install diesel_cli
RUN rustup component add clippy

COPY . .
