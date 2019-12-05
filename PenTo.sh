
read TARGET

echo " XSS Scanning"              
python Module/XssPy.py -u $TARGET -v
echo "XSS Scanning Finished"              
echo "════════════════════════════════════════════════════════════════"
echo "Fuzz Scanning"              
echo "starting fuzzing with waf ninja"
./wafninja fuzz -u "http://$TARGET/index.php?id=FUZZ" -c "phpsessid=value" -t xss -o output.html
echo "fuzzing finished"
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

export TARGET="$TARGET_DOMAIN"

./part-1.sh | tee part-1.output.txt
cp part-1.output.txt /root/desktop/part-1.output.txt
./part-2.sh | tee part-2.output.txt
cp part-2.output.txt /root/desktop/part-2.output.txt
