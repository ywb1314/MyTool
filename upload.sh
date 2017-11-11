#!/bin/bash

content=$1

if [ -z $content ]; then 
    content=`date +%y%m%d%H%M%S`
    echo $content
fi

git add . && git commit -a -m "${content}"
git push origin master