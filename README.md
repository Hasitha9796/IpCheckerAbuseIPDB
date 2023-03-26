# IpCheckerAbuseIPDB
Bash script that automates the process of checking IP addresses against the AbuseIPDB API

This script reads in a log file called logfile.txt and uses the grep command to extract each IP address found in the file. For each IP address, the script calls
the AbuseIPDB API using the curl command and parses the response with the jq command. If the AbuseIPDB confidence score for the IP address is 50 or higher, the
script prints a message to the console indicating the suspicious IP address and its confidence score. 

Note that you'll need to replace YOUR_API_KEY_HERE with your actual AbuseIPDB API key, and logfile.txt with the actual name of your log file. Also, make sure you have the jq command installed (you can install it on most Linuxsystems with sudo apt-get install jq or sudo yum install jq, depending on your package manager).
