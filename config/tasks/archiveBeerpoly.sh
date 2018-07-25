#!/bin/sh
set -e

zip -r "data/archive/beerpoly-$(date +%Y%m%d_%H%M%S).zip" "data/code/beerpoly"
