import subprocess

from i3pystatus import Status

status = Status(standalone=True)

status.register("clock",
        format="%a %-d %b %T KW%V",)

#status.register("weather",
#        format="{current_temp} {current_wind} {humidity}%",
#        location_code="NLXX0018:1:NL",)

status.register("pulseaudio",
        format="♪{volume}",)

status.register("load",
        critical_limit=4,)

status.register("shell",
        command="~/bin/cpufan.sh",)

status.register("shell",
        command="~/bin/cpumhz.sh",)

status.register("temp",
        format="c3: {temp:.0f}°C",
        file="/sys/devices/platform/coretemp.0/hwmon/hwmon1/temp5_input",)

status.register("temp",
        format="c2: {temp:.0f}°C",
        file="/sys/devices/platform/coretemp.0/hwmon/hwmon1/temp4_input",)

status.register("temp",
        format="c1: {temp:.0f}°C",
        file="/sys/devices/platform/coretemp.0/hwmon/hwmon1/temp3_input",)

status.register("temp",
        format="c0: {temp:.0f}°C",
        file="/sys/devices/platform/coretemp.0/hwmon/hwmon1/temp2_input",)

status.register("network",
        interface="enp2s0",
        format_up="{v4cidr}",)

status.run()
