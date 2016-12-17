#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage : $0 <password-amabari-ui> <ambarihost-ip>"
    exit 1
fi

curl -u admin:$2 -H 'X-Requested-By:poster' -X POST http://$1:8080/api/v1/blueprints/blueprint1 -d @blueprint.json
sleep 30
curl -u admin:$2 -H 'X-Requested-By:poster' -X POST http://$1:8080/api/v1/clusters/poc -d @blueprint-cluster-def.json
