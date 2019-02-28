from i3pystatus import Status

status = Status(standalone=True)

status.register("clock",
                format="%a %-d %b %T KW%V",)

status.register("pulseaudio",
                format="♪{volume}",
                step=1,
                color_unmuted="#00FF00")

status.register("redshift")

status.register("uptime",
                format="up {days}d {hours}:{mins}")

status.register("load",
                critical_limit=4,)

status.register(
    'battery',
    interval=5,
    format='B:{remaining}h [{status} ]{percentage:.1f}% {consumption:.1f}W',
    alert=True,
    alert_percentage=10,
    status={
        'DPL': 'DPL',
        'CHR': 'CHR',
        'DIS': 'DIS',
        'FULL': '',
    }
)

status.register("ping")

status.register("spotify")

status.run()
