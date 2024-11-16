FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    build-essential \
    && apt-get clean

# Ensure pip is up-to-date and tied to Python3.10
RUN python3.10 -m pip install --upgrade pip

# Install PyYAML
RUN python3.10 -m pip install PyYAML

COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]