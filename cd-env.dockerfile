FROM ubuntu:22.04
RUN apt-get -qq update -y && \
    apt-get -qq install -y curl gpg apt-utils lsb-release && \
    mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get -qq update -y && \
    apt-get -qq install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin \
    && rm -rf /var/lib/apt/lists/*
RUN adduser --disabled-password --gecos "" \
    --uid 1000 --shell /bin/bash jenkins && \
    usermod -aG docker jenkins