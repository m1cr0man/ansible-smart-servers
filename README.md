# Ansible SmartOS Server Configuration

Deploys a number of services into joyent-brand zones on a SmartOS server

Requires Ansible 2.8+

Current roles:

- Bare metal (deploys zones)
- Rsyncd
- Rsyslog
- M1cr0blog
- OpenTTD
- Minio Client (mc)
- Docker contaniers
    - InfluxDB
    - Chronograf
    - Telegraf
    - Traefik
    - Minio
- traefik routes
- ipf rules

Dependencies:

- None!


## TODO

- Detailed Readme
- Base zone config
    - mail spooler
- Refactor VM deploy
- Update baremetal deploy
