#!/bin/bash

VALUE="1024"

echo ${VALUE} | tee /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages

KEY="vm.nr_hugepages"
CONF_FILE="/etc/sysctl.conf"
if grep -qE "^\s*${KEY}\s*=" "${CONF_FILE}"; then
    sed -i -E "s|^\s*${KEY}\s*=.*|${KEY} = ${VALUE}|" "$CONF_FILE"
else
    echo "${KEY} = ${VALUE}" >> "$CONF_FILE"
fi
sysctl -p
