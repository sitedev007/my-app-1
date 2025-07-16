# Use Ubuntu 22.04 as base image
FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies including software-properties-common
RUN apt-get update && apt-get install -y \
    curl \
    sudo \
    git \
    build-essential \
    nodejs \
    npm \
    software-properties-common \
    && apt-get clean

# Add deadsnakes PPA and install Python 3.12
RUN add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.12 python3.12-distutils

RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.12

RUN pip3.12 install gdown

# Create a non-root user with password
RUN useradd -u 10002 -ms /bin/bash ajays && \
    echo 'ajays:ajays' | chpasswd && \
    adduser ajays sudo

# Create directory for SSH keys if needed
RUN mkdir -p /home/ajays/.ssh && chown -R ajays:ajays /home/ajays/.ssh
RUN cd /home/ajays/.ssh
RUN gdown --id 1JoYy-FQao5hduA4hTVarCC0LSx3Je4T_ && gdown --id 1f7qJfEPG8g_z2kitVXHiFmioh-DkDjv1

# Set permissions for SSH keys
# Ensure the keys are only readable by root
RUN chmod 600 /home/ajays/.ssh/id_rsa && \
    chmod 644 /home/ajays/.ssh/id_rsa.pub && \
    chown ajays:ajays /home/ajays/.ssh/id_rsa /home/ajays/.ssh/id_rsa.pub

COPY start.sh /home/ajays/start.sh

RUN chown ajays:ajays /home/ajays/start.sh
RUN chmod +x /home/ajays/start.sh


# Switch to non-root user
USER 10002

# Add GitHub's public SSH key to known_hosts
RUN ssh-keyscan github.com >> ~/.ssh/known_hosts

RUN cd /home/ajays && git clone git@github.com:ajay-satbhadre/choreo-test.git && cd choreo-test/backend && npm install 

# Expose the port will use
EXPOSE 3001

WORKDIR /home/ajays/choreo-test/backend

ENTRYPOINT ["/home/ajays/start.sh"]

# CMD ["npm", "start"]
