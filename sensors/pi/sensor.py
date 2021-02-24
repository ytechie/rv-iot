#https://simonhearne.com/2020/pi-metrics-influx/

import psutil
import json
import sys

# collect some stats from psutil
disk = psutil.disk_usage('/')
mem = psutil.virtual_memory()
load = psutil.getloadavg()

# format the data as a single measurement for influx
body = [
    {
        "load_1": load[0],
        "load_5": load[1],
        "load_15": load[2],
        "disk_percent": disk.percent,
        "disk_free": disk.free,
        "disk_used": disk.used,
        "mem_percent": mem.percent,
        "mem_free": mem.free,
        "mem_used": mem.used
    }
]

sys.stdout.write(json.dumps(body))