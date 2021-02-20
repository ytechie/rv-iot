import Vedirect
import json

#totally untested code

def on_victron_data_callback(data):
    print(data)
    sys.stdout.write(json.dumps(data))

ve = Vedirect.Vedirect()
ve.read_data_callback(on_victron_data_callback)