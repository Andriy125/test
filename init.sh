#!/bin/bash

echo "====================Start====================="
sudo apt-get update -y
sudo apt install npm -y
sudo apt install nodejs npm -y
sudo git clone https://github.com/Andriy125/test.git && cd test
sudo npm install
sudo npm start
echo "====================End====================="
