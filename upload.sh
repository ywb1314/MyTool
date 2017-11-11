#!/bin/bash

content=$1

git add . && git commit -a -m "${content}"
git push origin master