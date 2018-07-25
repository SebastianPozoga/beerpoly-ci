#!/bin/bash
set -e

mkdir -p serve/beerpoly
ran -p=8081 -r=data/serve/beerpoly -l=true &
ran -p=8082 -r=data/serve/beerpoly-home -l=true &
ran -p=8082 -r=data/archive -l=true &

sh -x "/go/src/github.com/goatcms/webslots/docker/entrypoint.sh"
