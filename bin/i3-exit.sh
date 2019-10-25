#!/bin/bash

lock() {
  /home/dmeulen/.i3/bin/i3locker.sh
}

case "$1" in
  lock)
    lock
    ;;
  logout)
    i3-msg exit
    ;;
  suspend)
    sudo /bin/systemctl suspend
    ;;
  reboot)
    reboot
    ;;
  shutdown)
    poweroff
    ;;
  *)
    echo "Usage: $0 [lock|logout|suspend|reboot|shutdown]"
    exit 2
esac

exit 0
