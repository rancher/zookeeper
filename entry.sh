#!/bin/bash

set -e

: ${CONFD_BACKEND:=env}

/confd -onetime -backend ${CONFD_BACKEND}

exec /opt/zookeeper/bin/zkServer.sh start-foreground
