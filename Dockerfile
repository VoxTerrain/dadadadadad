FROM debian:bullseye-slim

# Install basic dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    curl \
    git \
    ca-certificates \
    apt-transport-https \
    gpg

# Add Microsoft GPG key
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
    install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/ && \
    rm microsoft.gpg

# Add Visual Studio Code repository
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list

# Install Visual Studio Code
RUN apt-get update && apt-get install -y --no-install-recommends \
    code \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 8080
EXPOSE 443
# Start Visual Studio Code as root
CMD ["code", "--no-sandbox", "--user-data-dir=/root"]

