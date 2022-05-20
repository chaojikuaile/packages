#!/bin/bash

IMAGES[0]="licunchang/devops:latest"
IMAGES[1]="nginx:1.20.2"
IMAGES[2]="nginx:1.20.2-alpine"
IMAGES[3]="quay.io/martinhelmich/prometheus-nginxlog-exporter:v1"
IMAGES[4]="nginx/nginx-prometheus-exporter:0.10.0"
IMAGES[5]="grafana/grafana:8.4.6"
IMAGES[6]="prom/prometheus:v2.34.0"
IMAGES[7]="prom/alertmanager:v0.24.0"
IMAGES[8]="prom/blackbox-exporter:v0.19.0"
IMAGES[9]="prom/mysqld-exporter:v0.14.0"
IMAGES[10]="lmierzwa/karma:v0.103"
IMAGES[11]="oliver006/redis_exporter:v1.37.0"
IMAGES[12]="danielqsj/kafka-exporter:latest"
IMAGES[13]="gcr.io/cadvisor/cadvisor:v0.39.3"
IMAGES[14]="docker/compose:1.29.2"
IMAGES[15]="quay.io/vouch/vouch-proxy:alpine-0.36.0"
IMAGES[16]="redis:7.0.0"
IMAGES[17]="percona/pmm-server:2.27.0"
IMAGES[18]="mysql:8.0.28"
IMAGES[19]="owasp/modsecurity-crs:3.3.2-nginx"
IMAGES[20]="quay.io/keycloak/keycloak:18.0.0"

readonly IMAGES

indices=( ${!IMAGES[@]} )
for ((i=${#indices[@]} - 1; i >= 0; i--)) ; do
    image="${IMAGES[indices[i]]}"

    echo "${image}"
    repo=${image##*/}

    echo "  docker pull ${image}"
    docker pull ${image} 1> /dev/null
    echo "  docker tag ${image} registry.cn-zhangjiakou.aliyuncs.com/chaojikuaile/${repo}"
    docker tag ${image} registry.cn-zhangjiakou.aliyuncs.com/chaojikuaile/${repo}
    echo "  docker push registry.cn-zhangjiakou.aliyuncs.com/chaojikuaile/${repo}"
    docker push registry.cn-zhangjiakou.aliyuncs.com/chaojikuaile/${repo} 1> /dev/null

done
