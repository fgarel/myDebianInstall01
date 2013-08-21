#!/bin/sh
cat sys.txt | sed -e "s/^[0-9]*;//" -e "/^$/ d" > ../../home/blueflamingo/public_html/d-i/wheezy/pkgsrc.txt
