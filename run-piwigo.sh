#!/bin/bash


sudo apt update
sudo apt install docker.io -y
sudo docker run -d -p 80:80 rsargsyan/piwigo
