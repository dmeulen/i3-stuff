import subprocess

from i3pystatus import Status

status = Status(standalone=True)

status.register("clock",
        format="%a %-d %b %T KW%V",)

status.run()
