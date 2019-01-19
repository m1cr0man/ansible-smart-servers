#!/usr/bin/env bash

set -euo xtrace

. /lib/svc/share/smf_include.sh

export PATH="{{ default_path }}"

case "$1" in
'start')

  # Set up gateway vnic so baremetal can talk to vms
  if [ $(dladm show-vnic | grep gw0 | wc -l) -ne 1 ]; then
    dladm create-vnic -m 2:50:10:0:0:1 -l stub0 gw0
    ipadm create-addr -T static -a {{ address }}/24 gw0/v4
  fi

  # Link minio client config to persistent storage
  ln -s /usbkey/.mc /root/.mc

  ;;
'stop')

  # Delete gateway
  if [ $(dladm show-vnic | grep gw0 | wc -l) -eq 1 ]; then
    ipadm delete-addr gw0/v4 || true
    ipadm delete-if gw0
    dladm delete-vnic gw0
  fi

  # Remove minio client config link
  rm -rf /root/.mc

  ;;
*)
  echo "Usage: $0 { start | stop }"
  exit $SMF_EXIT_ERR_FATAL
  ;;
esac

exit $SMF_EXIT_OK
