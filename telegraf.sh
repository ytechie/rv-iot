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
    python3-pip \
    -y

git clone https://github.com/ytechie/rv-iot.git
cd /home/ubuntu/rv-iot/sensors/dht22
pip3 install -r requirements.txt
cd /home/ubuntu/rv-iot/sensors/ve_direct
pip3 install -r requirements.txt

# Install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker ubuntu
sudo systemctl enable docker.service

#todo: create network


docker run -d -p 8086:8086 \
      -v influxdb-storage:/var/lib/influxdb2 \
      -e DOCKER_INFLUXDB_INIT_MODE=setup \
      -e DOCKER_INFLUXDB_INIT_USERNAME=my-user \
      -e DOCKER_INFLUXDB_INIT_PASSWORD=my-password \
      -e DOCKER_INFLUXDB_INIT_ORG=rv-org \
      -e DOCKER_INFLUXDB_INIT_BUCKET=MainBucket \
      --name=influxdb \
      --network="host" \
      --restart unless-stopped \
      influxdb:2.0


docker run -d -p 3000:3000 -v grafana-storage:/var/lib/grafana \
    --network="host" \
    --name=grafana \
    --restart unless-stopped --user 472 grafana/grafana

# Permissions
sudo usermod -a -G dialout _telegraf #Serial port access
sudo chown _telegraf /dev/gpiomem #GPIO access


# List available buckets
docker exec -it influxdb influx bucket list

# Create a mapping so that Influx can talk to the new version of influx
# https://docs.influxdata.com/influxdb/v2.0/query-data/influxql/#map-unmapped-buckets
docker exec -it influxdb \
influx v1 dbrp create \
  --db example-db \
  --rp example-rp \
  --bucket-id 8f72a782edb44b3e \
  --default

# Get the auth token
docker exec -it influxdb influx auth list

# Configure Grafana
# https://docs.influxdata.com/influxdb/v2.0/tools/grafana/?t=InfluxQL


#git clone https://github.com/ytechie/rv-iot.git
#sudo cp telegraf.conf /etc/telegraf/telegraf.conf 
