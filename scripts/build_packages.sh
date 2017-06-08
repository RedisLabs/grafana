#!/bin/bash

docker build -t grafana/deb -f scripts/Dockerfile.debian scripts
docker run --rm -it -v `pwd`:/go/src/github.com/grafana/grafana grafana/deb