# jellyfin

## loeken-at-home

Using base library from https://bjw-s.github.io/helm-charts/docs/common-library/introduction/ to generate these helm charts.
- using same values.yaml as previous k8s-at-home charts
- if i can find good images i ll use these
- prefere small bases ( alpine )
- trivy / snyk for sec checks
- if not i ll create a github repo that has a github action to build the image ( linked in links: section of artifacthub.io`s helm chart page )
- dont forget to encrypt your secrets! ( https://artifacthub.io/packages/helm/bitnami-labs/sealed-secrets )

## Compatibility
validating chart versions against these kubernetes versions: 

["1.21.13", "1.22.16", "1.23.14","1.24.8", "1.25.4"]


## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.

## Custom configuration

N/A

## Values

you can find the main values.yaml for the library used by this chart here: https://github.com/bjw-s/helm-charts/blob/main/charts/library/common/values.yaml
