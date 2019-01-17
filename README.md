# Ansible SmartOS Server Configuration

Deploys a number of services into joyent-brand zones on a SmartOS server

Requires Ansible 2.8+

Current roles:

- Bare metal (deploys zones)
- Gateway (manages firewalling and routing)
- Rsyncd
- Rsyslog
- M1cr0blog
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

- Installing Minecraft server
- KVM support
- Detailed Readme
