#heimdall
heimdall_version=`curl -s "https://hub.docker.com/v2/repositories/linuxserver/heimdall/tags/?page_size=250&page=1&name=version-v2."| jq -c '.[]?' | jq -c '.[]?'.name|grep -v "arm64\|arm32\|amd64" | sort | tail -n1`

echo heimdall version: $heimdall_version
