FROM ubuntu:22.04
RUN apt-get -qq update -y && apt-get -qq install -y git \
    && rm -rf /var/lib/apt/lists/*
RUN adduser --disabled-password --gecos "" \
    --uid 1000 --shell /bin/bash jenkins
RUN git config --system user.name ubuntu@example.com
RUN git config --system user.name "Ubuntu Account"