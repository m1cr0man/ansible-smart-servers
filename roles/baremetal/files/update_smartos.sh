#!/usr/bin/env bash
set -euo pipefail

echo 'Downloading platform'
cd /var/tmp
curl -O --insecure https://us-east.manta.joyent.com/Joyent_Dev/public/SmartOS/platform-latest.tgz

mount -F pcfs /dev/dsk/c1t0d0p1 /mnt

echo 'Extracting platform'
cd /mnt
tar xzf /var/tmp/platform-latest.tgz

echo 'Installing new platform'

NEW_VERSION=$(echo platform-* | cut -d- -f2)
OLD_VERSION=$(uname -v | cut -d_ -f2)

mv /mnt/platform{,-$OLD_VERSION}
mv /mnt/platform{-$NEW_VERSION,}

cd /var/tmp
sync
umount /mnt

echo "Platform updated from $OLD_VERSION to $NEW_VERSION"
