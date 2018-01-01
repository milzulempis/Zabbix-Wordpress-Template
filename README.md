# Zabbix-Wordpress-Template
Wordpress template for zabbix

# Objective
Discovering all wordpress instances and checking for updates.

# How to:
* Add userparameter_wp.config to /etc/zabbix/zabbix_agentd.d/
* Copy wp_find_updates.sh and dicover_file.py to /etc/zabbix/scripts
* Import Wordpress template to Zabbix
* Configure checking times in WP Template->Discovery rules->Items prototypes as needed

# Some commands
```bash
mkdir /etc/zabbix/scripts
cp wp_find_updates.sh /etc/zabbix/scripts/
cp dicover_file.py /etc/zabbix/scripts/
chmod 755 /etc/zabbix/scripts/wp*
cp userparameter_wp.config /etc/zabbix/zabbix_agentd.d/
```

# Additional info
dicover_file.py is made as universal file discovery script. parameter 1 is search path.
parameter 2 is base64 encoded file name regex. It will return finded files array with full filename, basename, dirname, basename of dirname.
base64 is used due to UnsafeUserParameters in zabbix.

# Thanks
Many thanks to laacz for https://gist.github.com/laacz/9952926