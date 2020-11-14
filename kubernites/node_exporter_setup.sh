#!/bin/sh

set -e -o pipefail

# Download node_exporter armv7 version
nev=${1:="1.0.0"}
curl -SL https://github.com/prometheus/node_exporter/releases/download/v${nev}/node_exporter-${nve}.linux-armv7.tar.gz > node_exporter.tar.gz

# Store executable into usr/local/bin
target=${2:="/usr/local/bin/"}
tar -xvf node_exporter.tar.gz -C $target --strip-components=1

# Generate systemclt file
cat <<-EOF
[Unit]
Description=NodeExporter

[Service]
TimeoutStartSec=0
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOF > nodeexporter.service

