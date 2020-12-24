#!/bin/bash
pipenv run python app.py amazon --single-shot --p 8675309 --config-file evga_xc3.json &
evga_xc3_PID=$!
sleep 3
pipenv run python app.py amazon --single-shot --p 8675309 --config-file evga_ftw3.json &
evga_ftw3_PID=$!
sleep 3
pipenv run python app.py amazon --single-shot --p 8675309 --config-file asus_tuf.json &
asus_tuf_PID=$!
sleep 3

while [ true ] ; do
read -t 3 -n 1
if [ $? = 0 ] ; then
kill $evga_xc3_PID
kill $evga_ftw3_PID
kill $asus_tuf_PID
exit ;
fi
done
