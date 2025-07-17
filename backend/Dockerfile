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

COPY start.sh /home/ajays/start.sh

RUN chown ajays:ajays /home/ajays/start.sh
RUN chmod +x /home/ajays/start.sh


# Switch to non-root user
USER 10002

# Copy libs tar file to the home directory
COPY libs.tar /home/ajays/modules/libs.tar

# Extract the libs.tar file to the modules directory
RUN tar -xf /home/ajays/modules/libs.tar -C /home/ajays/modules/ && rm /home/ajays/modules/libs.tar

# Expose the port will use
EXPOSE 3001

WORKDIR /home/ajays

ENTRYPOINT ["/home/ajays/start.sh"]

# CMD ["npm", "start"]
