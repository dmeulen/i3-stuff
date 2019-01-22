from i3pystatus import Status

status = Status(standalone=True)

status.register("clock",
                format="%a %-d %b %T KW%V",)

status.register("pulseaudio",
                format="♪{volume}",
                step=1,
                color_unmuted="#00FF00")

status.register("redshift")

status.register("spotify")

status.run()
