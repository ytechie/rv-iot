#curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered | bash

#dht22 support
wget http://www.airspayce.com/mikem/bcm2835/bcm2835-1.68.tar.gz
tar zxvf bcm2835-1.68.tar.gz
cd bcm2835-1.68
./configure 
make 
make check 
make install

npm install --unsafe-perm -g node-dht-sensor
npm install --unsafe-perm -g node-red-contrib-dht-sensor
npm install node-red-contrib-dht-sensor

#npm install node-red-contrib-influxdb
