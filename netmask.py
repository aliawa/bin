#!/Users/aawais/workspace/scapy/py_venv/bin/python

# Print all address in a netmask block

import re
import ipaddress
from dataclasses import dataclass
import sys

print ()
if len(sys.argv) < 2:
    print ("need ip network needed")
    quit()

if sys.argv[1] == "-h":
    print (f"Usage:")
    print (f"{sys.argv[0]} 172.28.1.8/29")
    quit()

nw = ipaddress.ip_network(sys.argv[1])
for ip in nw.hosts():
    print (ip)


