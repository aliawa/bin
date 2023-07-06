#! /bin/bash

usage() {
    echo 
    echo "  Add two hex numbers"
    echo "  $(basename $0) <hex-number> <hex-number>"
    echo 
    exit
}


[ $# -lt 2 ] && usage

echo "obase=16; ibase=16; `echo "$1+$2" | tr [a-f] [A-F]`" | bc
