#!/bin/sh
set -e

zip -r "data/archive/beerpoly-home-$(date +%Y%m%d_%H%M%S).zip" "data/code/beerpoly-home"
