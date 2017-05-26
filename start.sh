#!/bin/bash
set -e

mkdir -p /root/sinopia
cd /root/sinopia
confd -onetime -backend env
exec verdaccio
