# Zabbix-Wordpress-Template
Wordpress template for zabbix

# Objective
Discovering all wordpress instances and checking for updates.

# How to:
* Add userparameter_wp.config to /etc/zabbix/zabbix_agentd.d/
* Copy scripts /etc/zabbix/scripts
* Configure wp-upgrade-check.sh PATHS and IGNOREPATHS
* Test crontab.txt commands and check /var/log/wp/*
* Add crontab.txt commands to crontab
* Import Wordpress template to Zabbix
* Configure checking times in WP Template->Discovery rules->Items prototypes

# Some commands
```bash
mkdir /etc/zabbix/scripts
cp wp-lld-zabbix.py /etc/zabbix/scripts/
cp wp-upgrade-check.sh /etc/zabbix/scripts/
chmod 755 /etc/zabbix/scripts/wp*
cp userparameter_wp.config /etc/zabbix/zabbix_agentd.d/
mkdir /var/log/wp
crontab -e
```

#Thanks
Many thanks to laacz for https://gist.github.com/laacz/9952926