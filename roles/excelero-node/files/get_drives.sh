#!/bin/bash

limit="50"
skip="0"
disks=()
empty=""

while [ -z "$empty" ]; do
    previous="${#disks[@]}"

    for disk in $(nvmesh drive show --limit $limit --skip $skip --output-format json | jq -r '.[].disks | select (.isExcluded==false and .health=="Healthy" and .isOutOfService!=true and .status=="Not_Initialized") | .diskID'); do
      disks+=($disk)
    done

    skip=$(( skip + 50 ))

    if [[ ${#disks[@]} -eq $previous ]]; then
      empty="1"
    fi

done

echo ${disks[@]} | tr ' ' '\n'
