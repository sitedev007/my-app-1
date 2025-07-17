#!/bin/bash

echo "$PRIVATE_SSH_KEY" > ~/.ssh/id_rsa

mkdir -p ~/.ssh && chmod 700 ~/.ssh

chmod 600 ~/.ssh/id_rsa

ssh-keyscan github.com >> ~/.ssh/known_hosts

git clone --depth 1 --filter=blob:none --sparse git@github.com:ajay-satbhadre/amazon-keyword-tracker.git /usr/app

cd /usr/app && git sparse-checkout set backend

cd backend && cp -rp ~/lib/* . && npm start

