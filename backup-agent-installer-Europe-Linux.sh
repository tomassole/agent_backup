#!/bin/bash

if [ "$(date +%Y%m%d)" -ge "20240724" ]; then
    echo "This installation script is out of date"
    echo "Please, download a new script from your Cloud Panel"
    exit
fi

acronis_repo="https://panel.cloudbuilder.es/download"
acronis_file="Backup_Agent_for_Linux_x86_64.bin"

if which zypper >/dev/null 2>&1; then
    zypper refresh -fdb >/dev/null
    zypper -n in kernel-default kernel-source gcc make perl rpm >/dev/null
elif which apt-get >/dev/null 2>&1; then
    apt-get update >/dev/null
    apt-get -y install linux-image-$(uname -r) linux-headers-$(uname -r) gcc make perl rpm >/dev/null
fi

curl -s ${acronis_repo}/${acronis_file} -o /tmp/${acronis_file}
bash /tmp/${acronis_file} --auto --token=4CB9-C052-4B6D
rm /tmp/${acronis_file}
