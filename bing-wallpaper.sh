#!/usr/bash
cd /Users/wasimakram/play/bing-wallpaper/
curl "http://themeserver.microsoft.com/default.aspx?p=Bing&c=Desktop&m=en-US" | grep -o 'url="[^"]*"' | sed -e 's/url="\([^"]*\)"/\1/' | sed -e "s/ /%20/g" > tmp.txt

#read file line
while read line
do
    fileName=$(echo $line | sed -e "s;.*/\([^\/]*\)$;\1;")
    if [[ -f $fileName ]]; then
        echo "$fileName existed" 
    else
        curl -O $line;
    fi
done < "tmp.txt"
