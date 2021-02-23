import Vedirect
import sys
import json

class Sensor:
    iterations = 0
    dictionary = {}

    def on_victron_data_callback(self, data):
        self.dictionary.update(data)

        if(self.iterations == 5):
            self.dictionary['Voltage'] = int(self.dictionary['V']) / 1000
            self.dictionary['BatteryPercent'] = int(self.dictionary['SOC']) / 10
            sys.stdout.write(json.dumps(self.dictionary))
            exit()

        self.iterations += 1


    def run(self):
        ve = Vedirect.Vedirect()
        ve.read_data_callback(self.on_victron_data_callback)

s = Sensor()
s.run()