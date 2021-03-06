sudo apt update
sudo apt upgrade -y

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    python3 \
    telegraf \
    -y

# Install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker ubuntu
sudo systemctl enable docker.service

#todo: create network

docker run -d -p 8086:8086 \
      --name influxdb2 \
      -v influxdb-storage:/var/lib/influxdb2 \
      influxdb:2.0

docker run -d -p 8086:8086 \
      -v influxdb-storage:/var/lib/influxdb2 \
      -e DOCKER_INFLUXDB_INIT_MODE=setup \
      -e DOCKER_INFLUXDB_INIT_USERNAME=my-user \
      -e DOCKER_INFLUXDB_INIT_PASSWORD=my-password \
      -e DOCKER_INFLUXDB_INIT_ORG=rv-org \
      -e DOCKER_INFLUXDB_INIT_BUCKET=MainBucket \
      influxdb:2.0 \
      --restart unless-stopped

docker run -d -p 3000:3000 -v grafana-storage:/var/lib/grafana \
    --restart unless-stopped --user 472 grafana/grafana

# Permissions
sudo usermod -a -G dialout _telegraf
