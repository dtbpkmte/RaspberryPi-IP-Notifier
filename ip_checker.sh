#!/bin/bash

script_dir=$(dirname "$(readlink -f "$0")")
if ! [[ -f $script_dir/last_ip.txt ]] ; then
	touch $script_dir/last_ip.txt
fi

cur_ip=$(dig +short myip.opendns.com @resolver1.opendns.com)
if [[ $(cat $script_dir/last_ip.txt) != $cur_ip ]] ; then
	echo $cur_ip > $script_dir/last_ip.txt
	curl -X POST "https://api.telegram.org/bot<TOKEN>/sendMessage" -d "chat_id=<CHAT_ID>&text=HomePI: $cur_ip" &> /dev/null
fi

