FROM rust:latest as builder

RUN apt-get update && apt-get install -y \
    libwebkit2gtk-4.0-dev \
    libgtk-3-dev \
    libayatana-appindicator3-dev \
    librsvg2-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /code

RUN cargo install diesel_cli

COPY . .
