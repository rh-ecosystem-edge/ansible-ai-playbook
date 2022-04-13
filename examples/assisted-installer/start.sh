#!/usr/bin/env bash

set -o errexit 
set -o pipefail 
set -o nounset
WORKDIR="/home/assisted-podman"
VOLUME_PATH="${WORKDIR}/pg_data"

echo "Creating data base folder at: ${VOLUME_PATH}..."
mkdir -p ${VOLUME_PATH} 

for package in "jq" "podman"
do 
    echo "Checking for ${package}"
    if ! (command -v ${package} &> /dev/null )
    then
        echo "Error missing ${package}"
        exit 1 
    fi
    echo "OK"
done

echo "Checking Podman Version"
echo "==========================="
PODMAN_VERSION=$(podman version --format json  | jq '.Client.Version'  | cut -d '"' -f 2)
if  [[  ! ${PODMAN_VERSION} > 3.3.0 ]]
then
    echo "ERROR: podman require minimum version of 3.3"
    exit 1
fi


echo "Getting Config files"

for file in "pod.yml" "configmap.yml"
do
    curl -s "https://raw.githubusercontent.com/rh-ecosystem-edge/ansible-ai-playbook/main/examples/assisted-installer/${file}"  > ${WORKDIR}/${file}
done

IP_ADDRESS=$(hostname -I | awk '{ print $1}')

sed -i "s|< HOST IP >|$IP_ADDRESS|g" ${WORKDIR}/configmap.yml

echo "Starting Assisted installer"
podman play kube --configmap "${WORKDIR}/configmap.yml" "${WORKDIR}/pod.yml"