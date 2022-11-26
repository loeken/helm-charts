#!/bin/bash
# $1 : heimdall
# $2 : chartversion
# $3 : appversion
mkdir charts/$1 -p
cp charts/example/templates -r charts/$1/
cp charts/example/Chart.yaml charts/$1/Chart.yaml
sed -i "s/chartname/$1/g" charts/$1/Chart.yaml
sed -i "s/chartversion/$2/g" charts/$1/Chart.yaml
sed -i "s/appversion/$3/g" charts/$1/Chart.yaml
