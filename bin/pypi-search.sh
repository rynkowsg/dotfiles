#!/bin/bash
# pypi-search.sh
# This script fetch data from https://pypi.org/simple/
# process the output for simple package name output with perl
# and then apply a regex pattern to the result
# Source: https://stackoverflow.com/a/66956129

pypiurl=https://pypi.org/simple/
currentdate=$(date +%y%m%d)

cachedir=~/.cache/simple-pypi
[[ -d $cachedir ]] || mkdir -p $cachedir

cachefile=$(ls -1 $cachedir/*_simple-pypi.html 2>/dev/null | sort | head -n1)
[[ $cachefile = "" ]] && cachefile=$cachedir/"${currentdate}_simple-pypi.html"

searchpattern="$1"
cmd="$2"

if [[ -f $cachefile ]] ; then
    dbdate=$(echo $cachefile | grep -Po "[0-9]{6,6}")
    # if db is older than 3 days or second parameter is 'update'
    ( (( ($currentdate - $dbdate) > 3 )) || [[ "x$cmd"  = 'xupdate' ]] ) && {
        echo "last update was on : $dbdate"
        cachefile=$cachedir/"${currentdate}_simple-pypi.html"
        wget -q --show-progress -O - $pypiurl > $cachefile
    }
else
    wget -q --show-progress -O - $pypiurl > $cachefile
fi

[[ x$searchpattern = "x" ]] && read -p "Enter pypi name pattern : " searchpattern
perl -pe 's/.*([\/"]{1,1}\>){1,1}([^>]+(.*)[^<])+\<\/a\>/\2/g' $cachefile | grep -P "$searchpattern"
