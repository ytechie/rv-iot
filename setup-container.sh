#curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered | bash

# dht22 support in node-red
#wget http://www.airspayce.com/mikem/bcm2835/bcm2835-1.68.tar.gz
#tar zxvf bcm2835-1.68.tar.gz
#cd bcm2835-1.68
#./configure 
#make 
#make check 
#make install
#npm install --unsafe-perm -g node-dht-sensor
#npm install --unsafe-perm -g node-red-contrib-dht-sensor
#npm install node-red-contrib-dht-sensor

# Install python stuff
apk add python3-dev
python3 -m pip install --upgrade pip setuptools wheel

# Install the library needed to read from the temp sensor
cd /root/sensors/dht22
pip3 install Adafruit_DHT


#npm install node-red-node-pi-gpio
#npm install node-red-node-twilio
#npm install @victronenergy/node-red-contrib-victron
#npm install node-red-contrib-influxdb
