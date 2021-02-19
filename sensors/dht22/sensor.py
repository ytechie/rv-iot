import Adafruit_DHT
import json
import sys

DHT_SENSOR = Adafruit_DHT.DHT22
DHT_PIN = 4

humidity, temperature = Adafruit_DHT.read_retry(DHT_SENSOR, DHT_PIN)

if humidity is not None and temperature is not None:
    data = {}
    data['TempC'] = temperature
    data['Humidity'] = humidity
    
    sys.stdout.write(json.dumps(data))
else:
    sys.stderr.write("Failed to retrieve data from humidity sensor")