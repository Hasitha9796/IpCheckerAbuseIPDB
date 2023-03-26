#!/bin/bash

# Set your API key and the path to your log file
API_KEY="ABUSEDBRAPIKEY"

#replace your log file with path
LOG_FILE="/var/log/auth.log"

# Loop through each IP address in the log file
grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" $LOG_FILE | while read ip_address; do
    # Check the IP address against the AbuseIPDB API
    response=$(curl -s -G --data-urlencode "ipAddress=$ip_address" --data-urlencode "maxAgeInDays=90" -H "Key: $API_KEY" -H "Accept: application/json" "https://api.abuseipdb.com/api/v2/check")
    score=$(echo $response | jq -r '.data.abuseConfidenceScore')
    if [ $score -ge 50 ]; then
        echo "Suspicious IP address found: $ip_address"
        echo "AbuseIPDB confidence score: $score"
    fi
done
