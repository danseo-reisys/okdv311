#!/bin/bash

## Default variables to use
export INTERACTIVE=${INTERACTIVE:="true"}
export PVS=${INTERACTIVE:="true"}
export DOMAIN=${DOMAIN:="$(curl -s ipinfo.io/ip).nip.io"}
export USERNAME=${USERNAME:="$(whoami)"}
export PASSWORD=${PASSWORD:=password}
export VERSION=${VERSION:="3.11"}
export SCRIPT_REPO=${SCRIPT_REPO:="https://raw.githubusercontent.com/gshipley/installcentos/master"}
export IP=${IP:="$(ip route get 8.8.8.8 | awk '{print $NF; exit}')"}
export API_PORT=${API_PORT:="8443"}
export LETSENCRYPT=${LETSENCRYPT:="false"}
export MAIL=${MAIL:="example@email.com"}
        for i in `seq 1 200`;
        do
                DIRNAME="vol$i"
                mkdir -p /mnt/data/$DIRNAME
                chcon -Rt svirt_sandbox_file_t /mnt/data/$DIRNAME
                chmod 777 /mnt/data/$DIRNAME

                sed "s/name: vol/name: vol$i/g" vol.yaml > oc_vol.yaml
                sed -i "s/path: \/mnt\/data\/vol/path: \/mnt\/data\/vol$i/g" oc_vol.yaml
                oc create -f oc_vol.yaml
                echo "created volume $i"
        done

