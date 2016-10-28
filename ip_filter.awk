#!/usr/bin/awk -f
BEGIN {name="";skip=0;print ""}
/^[0-9]:/ {
    name=$1" "$2
    if ( index($0, "DOWN")) { 
        skip=1 
    } else {
        skip=0
    }
}
$1~"link.*" {
    printf "%s [%s]\n", name,$2
}
{
    if (skip) {
        next
    }
}
/inet6/  {
    printf "\t● %-6s| %s\n", $4, $2
}
/inet /  {
    scope = gensub(/.*scope ([a-z]+) .*/, "\\1", "g", $0)
    printf "\t● %-6s| %s\n", scope, $2
}
END {
    print ""
}
