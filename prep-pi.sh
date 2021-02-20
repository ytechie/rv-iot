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

docker run -d -p 1880:1880 -v node_red_data:/data --privileged --restart unless-stopped nr