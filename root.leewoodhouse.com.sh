#!/bin/bash

# This script only updates the root record name
# By specifing the record_identifier it prevents the script from attempting to alter the MX/TXT records


auth_email="lpwoodhouse@gmail.com"
auth_method="global"
auth_key="6228478a2a1fb9ce09407e693b0bd979ac6f7"
zone_identifier="e010c68bd727a67de05d9be4cdbcb838"
record_name="leewoodhouse.com"
proxy=false
record_identifier="5909e53e54ec5a2a1f36ef07562c9d45"
ip=$(curl -s https://api.ipify.org || curl -s https://ipv4.icanhazip.com/)
auth_header="X-Auth-Key:"
record_identifier="5909e53e54ec5a2a1f36ef07562c9d45"

update=$(curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/$zone_identifier/dns_records/$record_identifier" \
                     -H "X-Auth-Email: $auth_email" \
                     -H "$auth_header $auth_key" \
                     -H "Content-Type: application/json" \
              --data "{\"id\":\"$zone_identifier\",\"type\":\"A\",\"proxied\":${proxy},\"name\":\"$record_name\",\"content\":\"$ip\"}")
