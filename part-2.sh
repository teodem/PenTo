#!/bin/bash

echo "Fuzz Scanning"
echo "starting fuzzing with waf ninja"
./wafninja fuzz -u "http://$TARGET/index.php?id=FUZZ" -c "phpsessid=value" -t xss -o output.html
echo "fuzzing finished"
echo "moving wafninja fuzz output to /root/desktop"
cp output.html /root/desktop/wafninja-fuzz.output.html
echo ""
echo "starting fuzzing.php web dir"
echo ""
python3 Module/dirsearch/dirsearch.py -u http://$TARGET -e .php
echo ""
echo "fuzzing .php web dir"
echo ""
echo ""
echo "starting.asp web dir finished"
python3 Module/dirsearch/dirsearch.py -u http://$TARGET -e .asp
echo "fuzzing .asp web dir finished"
echo ""
echo ""
echo "Fuzz  Scanning Finished"
