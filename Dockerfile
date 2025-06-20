# Start from the official n8n image
FROM n8nio/n8n:latest

# Switch to the root user to install system packages
USER root

# Install Chromium browser and its required dependencies
RUN apt-get update && apt-get install -y \
    chromium \
    --no-install-recommends \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Go to the designated custom modules folder for n8n
# and install the node packages there.
RUN mkdir -p /home/node/.n8n/custom && \
    cd /home/node/.n8n/custom && \
    npm install puppeteer axios

# Switch back to the non-root user that n8n runs as
USER node
