#!/usr/bin/env bash

set -euo xtrace

. /lib/svc/share/smf_include.sh

export PATH="{{ default_path }}"
export IPNAT_CONFIG="/etc/ipf/ipnat.conf"
export IPNAT_CONFIG_SOURCE="{{ ipnat_config_dir }}"

case "$1" in
'refresh')

  # Check folder is empty to avoid a non-zero exit
  if [ -z $(ls -1 "$IPNAT_CONFIG_SOURCE") ]; then exit 0; fi

  cat "$IPNAT_CONFIG_SOURCE"/* > "$IPNAT_CONFIG"
  svcadm refresh ipfilter

  ;;
'start')

  "$0" refresh
  routeadm -u -e ipv4-forwarding

  ;;
'stop')

  rm "$IPNAT_CONFIG"
  svcadm refresh ipfilter
  routeadm -u -d ipv4-forwarding

  ;;
*)

  echo "Usage: $0 { start | stop | refresh }"
  exit $SMF_EXIT_ERR_FATAL

  ;;
esac

exit $SMF_EXIT_OK
