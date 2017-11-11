#!/bin/bash

content=$1

if [ -z $content ]; then 
    # content=`date +%y%m%d%H%M%S`
    content="`date +%F` `date +%H`:`date +%M`:`date +%S`"
    echo $content
fi

git add . && git commit -a -m "${content}"
git push origin master