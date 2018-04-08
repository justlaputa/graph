# About
for showing my data in grafana

# How to

## start all services

```
docker-compose up
```

it will start influxdb and grafana

## create influxdb database

first create an influxdb database so we can write time-series data to it.

```
# use http api
curl -i -XPOST http://localhost:8086/query --data-urlencode "q=CREATE DATABASE mydb"
```

