#!/bin/bash

content=$1

if [ -z $content ]; then 
    # content=`date +%y%m%d%H%M%S`
    content="`date +%F` `date +%H`:`date +%M`:`date +%S`"
    echo $content
fi

git add . && git commit -a -m "${content}"
# git push origin yzw2.1.3

cd $PWD
if [ -d '.git' ]; then
    output=`git symbolic-ref --short -q HEAD`
    if [ "$output" ]; then
        git push origin "${output}"
    else
    	echo "未找到分支"
    fi
else
	echo "不是git分支"
fi