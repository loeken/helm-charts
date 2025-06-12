# chartname

## loeken-at-home

Using base library from https://bjw-s-labs.github.io/helm-charts to generate these helm charts.
- using same values.yaml as previous k8s-at-home charts
- if i can find good images i ll use these
- prefere small bases ( alpine )
- trivy / snyk for sec checks
- if not i ll create a github repo that has a github action to build the image ( linked in links: section of artifacthub.io`s helm chart page )
- dont forget to encrypt your secrets! ( https://artifacthub.io/packages/helm/bitnami-labs/sealed-secrets )


## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.

## Custom configuration


## Values

you can find the main values.yaml for the library used by this chart here: https://github.com/bjw-s/helm-charts/blob/main/charts/library/common/values.yaml

## Problems?

please raise them on https://github.com/loeken/helm-charts