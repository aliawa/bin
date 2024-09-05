#!/usr/bin/awk -f
BEGIN {
    name=""
    skip=0
    print ""
    digits = log(ARGV[1])/log(10) + 1
    ARGV[1]=""
}

/^[0-9]+:/ {
    num=$1
    name=$2
    if ( index($0, "DOWN")) { 
        skip=1 
    } else {
        skip=0
    }
}
$1~"link.*" {
    printf "%*d: %s [%s]\n", digits, num, name, $2
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
