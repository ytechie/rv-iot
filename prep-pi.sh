# This script is meant to be run on a Pi running Ubuntu ARM 64-bit
# Set up your SD card using the Pi Imager: https://www.raspberrypi.org/software/

#set the hostname to something more friendly
sudo hostnamectl set-hostname rv-pi

sudo apt update
sudo apt upgrade -y

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    libraspberrypi-bin \ #not necessary
    -y


curl -fsSL https://get.docker.com -o get-docker.sh

sudo sh get-docker.sh

sudo usermod -aG docker ubuntu

#Allow docker to start at boot
sudo systemctl enable docker.service

docker run -d -p 1880:1880 -v node_red_data:/data --privileged --restart unless-stopped ytechie/rv-pi-nodered

#if you want to run influx and grafana locally
docker run -i -d -p 8086:8086 \
      -v /var/influxdb-storage:/var/lib/influxdb \
      --restart unless-stopped \
      influxdb

docker run -d -p 3000:3000 -v grafana-storage:/var/lib/grafana \
    --restart unless-stopped --user 472 grafana/grafana

sleep 5 #give influx a few seconds to start up
curl -G http://localhost:8086/query --data-urlencode "q=CREATE DATABASE rvdata"
