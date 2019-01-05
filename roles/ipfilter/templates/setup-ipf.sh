#!/usr/bin/env bash

set -euo xtrace

. /lib/svc/share/smf_include.sh

export PATH="{{ default_path }}"
export IPF_CONFIG="/etc/ipf/ipf.conf"
export IPF_CONFIG_SOURCE="{{ ipf_config_dir }}"

case "$1" in
'refresh')

  # Check folder is empty to avoid a non-zero exit
  if [ -z $(ls -1 "$IPF_CONFIG_SOURCE") ]; then exit 0; fi

  cat "$IPF_CONFIG_SOURCE"/* > "$IPF_CONFIG"

  ;;
'start')

  "$0" refresh

  ;;
'stop')

  echo -e "pass in all\npass out all keep state" > /etc/ipf/ipf.conf

  ;;
*)

  echo "Usage: $0 { start | stop | refresh }"
  exit $SMF_EXIT_ERR_FATAL

  ;;
esac

exit $SMF_EXIT_OK
