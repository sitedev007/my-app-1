#!/bin/bash


export HOST=0.0.0.0

cp -rp /home/ajays/choreo-test/backend/* /usr/app 

cd /usr/app && npm start

