#!/bin/bash -e

tmpfile=$(mktemp /tmp/speedtest.XXXXXX)

echo 'run speedtest-cli ...'
/home/laputa/workspace/bin/speedtest-cli --json > ${tmpfile}

ping=$(jq '.ping' ${tmpfile})
download=$(jq '.download' ${tmpfile})
upload=$(jq '.upload' ${tmpfile})
datetime=$(jq -r '.timestamp' ${tmpfile})
timestamp=$(date -d $datetime +"%s")

echo "send metrics to influxdb: ping $ping, download $download, upload $upload, timestamp $timestamp"

curl --max-time 10 -X POST "http://$INFLUXDB_HOST:8086/write?db=mydb" --data-binary "ping,host=laputa-home-nuc value=$ping $timestamp
download,host=laputa-home-nuc value=$download $timestamp
upload,host=laputa-home-nuc value=$upload $timestamp"

echo 'done'
