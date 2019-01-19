#!/usr/bin/env bash

PATH="{{ default_path }}"
CACHE="/opt/custom/cache"

mkdir -p "${CACHE}"

function update_image {
    local name="$1"

    local latest_date="$(mc cat m1s3/artifacts/zones/${name}-latest.txt)"

    if [ ! -e "${CACHE}/lx-${name}-${latest_date}*" ]; then
        rm "${CACHE}/lx-${name}"*
        mc cp "m1s3/artifacts/zones/lx-${name}-${latest_date}"{.json,.zfs.gz} "${CACHE}/"
        imgadm install -m "${CACHE}/lx-${name}-${latest_date}.json" -f "${CACHE}/lx-${name}-${latest_date}.zfs.gz"
    fi
}

function main {
    update_image alpine
}

main
