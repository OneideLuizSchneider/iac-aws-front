#!/bin/bash
sudo apt-get update
# docker installation
sudo curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh
sudo usermod -aG docker ${USER}
sudo rm -rf get-docker.sh