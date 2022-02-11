# Convert date from Wireshark to PanOS date format found in
# dp-monitor and session details

# Input format:  "Jan 20, 2022 11:13:46.774325000 PST"
# Output format: "2022-01-20 11:13:46"

# The output timezone will be UTC

TZ=UTC date -d"$*" +"%Y-%m-%d %H:%M:%S"



