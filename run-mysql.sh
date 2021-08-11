#!/bin/bash


sudo apt update
sudo apt install docker.io -y
sudo docker run -p 3306:3306 -e MYSQL_ROOT_PASSWORD=Admin123! -e MYSQL_DATABASE=piwigo-db -d mysql:5
