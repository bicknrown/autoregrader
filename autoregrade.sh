#!/bin/bash

#
# nick's Autolab autograder batch regrade script
#

submission_ids_file="submission_ids.txt"
logfile="graderlog.txt"

while read -r id; do
echo "sending post for regrade of submission $id" | tee -a $logfile
curl -H "Host:<fill in the blank>" \
    -H "User-Agent:<fill in the blank>" \
    -H "Accept:<fill in the blank>" \
    -H "Accept-Language:<fill in the blank>" \
    -H "Accept-Encoding:<fill in the blank>" \
    -H "Content-Type:<fill in the blank>" \
    -H "Content-Length:<fill in the blank>" \
    -H "Origin: https://<fill in the blank>" \
    -H "DNT:<fill in the blank>" \
    -H "Connection:<fill in the blank>" \
    -H "Referer:https://<fill in the blank>/submissions" \
    -H "Cookie:<fill in the blank>" \
    -H "Upgrade-Insecure-Requests:<fill in the blank>" \
    -H "Sec-Fetch-Dest:<fill in the blank>" \
    -H "Sec-Fetch-Mode:<fill in the blank>" \
    -H "Sec-Fetch-Site:<fill in the blank>" \
    -H "Sec-Fetch-User:<fill in the blank>" \
    --data "_method=post&authenticity_token=<fill in the blank>" \
    -v \
    "https://<fill in the blank>/regrade?submission_id=$id"

if [ $? -eq 0 ]; then
    echo "autograder returned successfully for regrade of submission $id" | tee -a $logfile
else
    echo "autograder regrade was NOT successful for regrade of submission $id" | tee -a $logfile
fi

done <"$submission_ids_file"
