# Use Ubuntu 22.04 as base image
FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies including software-properties-common
RUN apt-get update && apt-get install -y \
    curl \
    git

# Add NodeSource Node.js 22 repo and install nodejs
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean


# Create a non-root user with password
RUN useradd -u 10002 -ms /bin/bash ajays && \
    echo 'ajays:ajays' | chpasswd && \
    adduser ajays sudo

COPY --chown=ajays:ajays start.sh /home/ajays/start.sh

RUN chmod +x /home/ajays/start.sh

COPY --chown=ajays:ajays package.json /home/ajays/lib/package.json

# Switch to non-root user
USER 10002


RUN cd /home/ajays/lib && npm install && rm package.json

# Expose the port will use
EXPOSE 3001

WORKDIR /home/ajays

ENTRYPOINT ["/home/ajays/start.sh"]

# CMD ["npm", "start"]
