#!/bin/sh

# your lastpass username
user=$(cat ~/.lpass_username)
# path to lpass binary
lpass=/usr/bin/lpass
# set to 1 if you want to have clipboards cleared
# after $clipboardafter seconds
clearclipboard=0
clearclipboardafter=30

lpass_login() {
    if ! $lpass login --trust $user; then
        exit 1
    fi
}

if [[ $1 == "username" ]]; then
  lpass_return_value='--username'
else
  lpass_return_value='--password'
fi

# if lpass ls fails, try to log in
if ! $lpass ls 2> /dev/null; then
    lpass_login
fi

last_entry=$(cat ~/.cache/i3lpass.last)

# select password using dmenu
selected_entry=$( ([[ -n ${last_entry} ]] && echo $last_entry; $lpass ls | egrep "[A-Za-z0-9]+\s\[id: [0-9]+\]" | sed -r 's/^(.*) \[id.*\]$/\1/') | dmenu -i)

echo "${selected_entry}" > ~/.cache/i3lpass.last

# clip password to clipboard
# xargs is not really practical here because of the \ used by lastpass
$lpass show --clip ${lpass_return_value} "${selected_entry}"

# copy CLIPBOARD to PRIMARY selection
xsel -b | xsel -p -i

if [[ $2 == "paste" ]]; then
  xdotool key Shift+Insert
fi

# if needed, clear clipboards after defined sleep
if [[ $clearclipboard -eq 1 ]]; then
    sleep $clearclipboardafter
    xsel -b -c
    xsel -p -c
fi
