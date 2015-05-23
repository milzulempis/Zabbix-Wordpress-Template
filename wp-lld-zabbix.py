#!/usr/bin/python

import os
import json
import sys

data = []

if len(sys.argv)<3:
	print json.dumps({'data':data,'error':'Usage: wp-lld-zabbix.py path name'})
	sys.exit(1)

if not os.path.isdir(sys.argv[1]):
	print json.dumps({'data':data,'error': sys.argv[1]+' is not a directory'})
	sys.exit(1)

def find_all(name, path):
    result = []
    for root, dirs, files in os.walk(path):
        if name in files:
            result.append(os.path.join(root, name))
    return result

for wppath in find_all(sys.argv[2],sys.argv[1]):
	data.append({'{#WPPATH}':os.path.dirname(wppath),'{#WPNAME}':os.path.basename(os.path.dirname(wppath))})

print json.dumps({'data':data})