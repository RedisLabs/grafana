#!/bin/bash
_grafana_version=$1

rm -rf /tmp/grafana_build
mkdir -p /tmp/grafana_build
cp scripts/production/Dockerfile /tmp/grafana_build/
cp scripts/production/run.sh /tmp/grafana_build/
cp dist/grafana_${_grafana_version}_amd64.deb /tmp/grafana_build/


docker build \
		--build-arg DEB_FILE=grafana_${_grafana_version}_amd64.deb \
		--tag "grafana/grafana:${_grafana_version}" \
		--no-cache=true /tmp/grafana_build/
docker tag grafana/grafana:${_grafana_version} grafana/grafana:latest