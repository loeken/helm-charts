#/bin/bash
cd charts
for d in */ ; do
    helm package $d
   
    version=`cat $d"Chart.yaml"|grep version|grep -v "  "|cut -d" " -f 2`
    chartName=`echo $d | cut -d"/" -f 1`
    helm dependency update $chartName
    echo '# $chartName

## Requirements
Tested with Kubernetes: v1.23.12

Cannot guarantee compatibility with higher versions of kubernetes

## Add Repository
```
helm repo add loeken-at-home https://loeken.github.io/helm-charts
```
## Using this chart
```
helm install '$chartName' loeken-at-home/'$chartName' --version '$version'
```

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.

## Custom configuration

N/A

## Values

you can find the main values.yaml for the library used by this chart here: https://github.com/bjw-s/helm-charts/blob/main/charts/library/common/values.yaml' > $d"README.md"
done
cd ..
helm repo index . --url https://loeken.github.io/helm-charts
