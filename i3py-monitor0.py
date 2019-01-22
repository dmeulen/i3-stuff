from i3pystatus import Status

status = Status(standalone=True)

status.register("clock",
                format="%a %-d %b %T KW%V",)

status.register("pulseaudio",
                format="♪{volume}",
                step=1,
                color_unmuted="#00FF00")

status.register("uptime",
                format="up {days}d {hours}:{mins}")

status.register("cpu_usage")

status.register("load",
                critical_limit=4,)

status.register("shell",
                command="~/bin/cpumhz.sh",)

status.register("temp",
                format="c3: {temp:.0f}°C",
                file="/sys/devices/platform/coretemp.0/hwmon/hwmon2/temp5_input",)

status.register("temp",
                format="c2: {temp:.0f}°C",
                file="/sys/devices/platform/coretemp.0/hwmon/hwmon2/temp4_input",)

status.register("temp",
                format="c1: {temp:.0f}°C",
                file="/sys/devices/platform/coretemp.0/hwmon/hwmon2/temp3_input",)

status.register("temp",
                format="c0: {temp:.0f}°C",
                file="/sys/devices/platform/coretemp.0/hwmon/hwmon2/temp2_input",)

status.register("network",
                interface="enp0s31f6",
                format_up="{v4cidr}",)

status.register("ping")

status.run()
