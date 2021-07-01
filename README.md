# RaspberryPi-IP-Notifier

A Bash script to notify user if Raspberry Pi's IP address has changed via Telegram.

Usage
-----

This script sends messages via Telegram, so you will need [a Telegram bot](https://core.telegram.org/bots) and the recipient's chat ID. Replace \<TOKEN> and <CHAT_ID> in the script with the corresponding values.

You can create a new entry in crontab to run the script at specific times. First open crontab: `crontab -e`.  
Then add the following line to the end of the file to run the script hourly: `@hourly /path/to/script/ip_checker.sh`.  
You can change `@hourly` to a value that you want.

How it works
------------

The script generates a file called `last_ip.txt` in the same directory as the script to store the last IP address. It then checks hourly: if the current IP address is not the same as the last IP address (in last_ip.txt file), it updates the file and sends a message (containing the new IP) to specified user via Telegram.

Credits and References
----------------------

This script is based on [Daniel Lombardi's Home IP Checker](https://github.com/LombardiDaniel/ip-checker), which is written in Python. I took it as reference and rewrite in Bash. My version is more simple and has less functionality because I just wanted to suit my needs.
