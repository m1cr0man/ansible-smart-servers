package all

import (
	_ "github.com/influxdata/telegraf/plugins/inputs/cpu"
	_ "github.com/influxdata/telegraf/plugins/inputs/influxdb"
	_ "github.com/influxdata/telegraf/plugins/inputs/minecraft"
	_ "github.com/influxdata/telegraf/plugins/inputs/mongodb"
	_ "github.com/influxdata/telegraf/plugins/inputs/mysql"
	_ "github.com/influxdata/telegraf/plugins/inputs/nginx"
	_ "github.com/influxdata/telegraf/plugins/inputs/syslog"
	_ "github.com/influxdata/telegraf/plugins/inputs/teamspeak"
	_ "github.com/m1cr0man/smartos-telegraf-plugins/inputs/smartos_cpu"
	_ "github.com/m1cr0man/smartos-telegraf-plugins/inputs/smartos_disk"
	_ "github.com/m1cr0man/smartos-telegraf-plugins/inputs/smartos_net"
	_ "github.com/m1cr0man/smartos-telegraf-plugins/inputs/smartos_ram"
)
