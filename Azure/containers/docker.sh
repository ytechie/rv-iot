docker run -i -d -p 8086:8086 \
      -v /var/influxdb-storage:/var/lib/influxdb \
      --restart unless-stopped \
      influxdb

curl -G http://localhost:8086/query --data-urlencode "q=CREATE DATABASE rvdata"

docker run -d -p 3000:3000 -v grafana-storage:/var/lib/grafana \
    --restart unless-stopped --user 472 grafana/grafana