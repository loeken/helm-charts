# $chartName

## Requirements
Tested with Kubernetes: v1.23.12

Cannot guarantee compatibility with higher versions of kubernetes

## Add Repository
```
helm repo add loeken-at-home https://loeken.github.io/helm-charts
```
## Using this chart
```
helm install rtorrent-flood loeken-at-home/rtorrent-flood --version 0.0.3
```

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.

## Custom configuration

N/A

## Values

you can find the main values.yaml for the library used by this chart here: https://github.com/bjw-s/helm-charts/blob/main/charts/library/common/values.yaml
