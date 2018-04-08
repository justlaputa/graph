How to
======

download [speedtest-cli](https://github.com/sivel/speedtest-cli) to your local

run speed test every hour on your home and send metrics data to influxdb

put systemd timer files

```
sudo cp speedtest.service speedtest.timer /etc/systemd/system
sudo systemctl enable speedtest.timer
```
