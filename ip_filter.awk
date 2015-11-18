#!/usr/bin/awk -f
BEGIN {name="";print ""}
/^[0-9]:/ {name=$1" "$2}
$1~"link.*" {printf "%s [%s]\n", name,$2}
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
