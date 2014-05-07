#!/usr/bin/env bash
cd $(dirname $0)
docker build -t mumoshu/squid-gem-proxy .
