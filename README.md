# Ansible SmartOS Server Configuration

Deploys a number of services into joyent-brand zones on a SmartOS server

Current roles:

- Bare metal (deploys zones)
- Gateway (manages firewalling and routing)
- Rsyncd
- InfluxDB
- Chronograf
- Telegraf

Dependencies:

- Second IP and MAC address for the gateway


## TODO

- Installing Minecraft server
- M1cr0blog module
