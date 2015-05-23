#!/bin/bash
 
#
# Script will find all wordpress installs and check if they're out of date
#
 
# Using wp-cli - http://wp-cli.org/
 
# Paths to search for wordpresses. Separated by space.
PATHS="/var/www"

# Paths to ignore (should not be checked). End with semicolon ;
IGNOREPATHS="/var/www/kludas;/var/www/noskrien.lv/old/wordpress;"
WPCLI=/usr/local/bin/wp-cli
WORDPRESSES=$(find $PATHS -type d -name "wp-includes" -print)
 
# Loop through results
for WPATH in $WORDPRESSES; do
    
    # Strip wp-includes from path
    WPATH=$(dirname $WPATH)

    # If folder is excluded, continue
    if [ "${IGNOREPATHS/$WPATH;}" != "$IGNOREPATHS" ]; then
        continue;
    fi

    # debug display path
    #echo "$WPATH"
    #continue;

    # Get core update
    WPUPDATE=$($WPCLI --allow-root --path=$WPATH core check-update | grep -P -m 1 "\d\.\d" | cut -f1)

    if [ ! -z "$WPUPDATE" ] 
    then
       WPUPDATE="core->$WPUPDATE"
    fi

    # Get plugin updates
    while read -r line
    do
       WPUPDATE="$WPUPDATE plugin->$line"
    done< <($WPCLI --allow-root --path=$WPATH plugin status | grep -P "^\sU" | cut -d" " -f3) 

    # Print output
    if [ -z "$WPUPDATE" ] 
    then
       echo "${WPATH:9}	OK"
    else
       echo "${WPATH:9}	$WPUPDATE"
    fi

done
