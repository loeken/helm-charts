#/bin/bash
cd charts
for d in */ ; do
    helm package $d
done
helm repo index . --url https://loeken.github.io/helm-charts