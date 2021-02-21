import Vedirect
import sys

#totally untested code

def on_victron_data_callback(data):
    #print(data)
    #sys.stdout.write(data)
    foo = 2

ve = Vedirect.Vedirect()
ve.read_data_callback(on_victron_data_callback)