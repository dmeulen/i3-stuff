#!/bin/sh

# your lastpass username
user=$(cat ~/.lpass_username)
# path to lpass binary
lpass=/usr/bin/lpass
# set to 1 if you want to have clipboards cleared
# after $clipboardafter seconds
clearclipboard=0
clearclipboardafter=30

login() {
    if ! $lpass login $user; then
        exit 1
    fi
}

# if lpass ls fails, try to log in
if ! $lpass ls 2> /dev/null; then
    login
fi

last_entry=$(cat ~/.cache/i3lpass.cache)

# select password using dmenu
selected_entry=$( ([[ -n ${last_entry} ]] && echo $last_entry; $lpass ls | egrep "[A-Za-z0-9]+\s\[id: [0-9]+\]" | sed -r 's/^(.*) \[id.*\]$/\1/') | dmenu -i)

echo "${selected_entry}" > ~/.cache/i3lpass.cache
# clip password to clipboard
# xargs is not really practical here because of the \ used by lastpass
$lpass show --clip --password "${selected_entry}"

# copy CLIPBOARD to PRIMARY selection
xsel -b | xsel -p -i

# if needed, clear clipboards after defined sleep
if [[ $clearclipboard -eq 1 ]]; then
    sleep $clearclipboardafter
    xsel -b -c
    xsel -p -c
fi
