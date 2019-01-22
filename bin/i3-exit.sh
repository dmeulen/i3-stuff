#!/bin/bash

lock() {
  i3lock -c 000000 --screen=0 --blur=0.1 --composite
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
