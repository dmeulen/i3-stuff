#!/bin/bash

lock() {
  i3lock -c 000000 --dpms --image ~/Pictures/wallpaper/fake_desk.png --pointer=win
}

case "$1" in
  lock)
    lock
    ;;
  logout)
    i3-msg exit
    ;;
  suspend)
    lock &&
      systemctl suspend
    ;;
  reboot)
    systemctl reboot
    ;;
  shutdown)
    systemctl halt
    ;;
  *)
    echo "Usage: $0 [lock|logout|suspend|reboot|shutdown]"
    exit 2
esac

exit 0
