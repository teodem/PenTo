#!/bin/bash

echo " XSS Scanning"
python Module/XssPy.py -u $TARGET -v
echo "XSS Scanning Finished"
echo "════════════════════════════════════════════════════════════════"             
