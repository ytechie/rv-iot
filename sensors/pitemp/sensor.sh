/opt/vc/bin/vcgencmd measure_temp | awk -F "[=']" '{print "{\"CpuTempC\":", $2, "}";}'