#!/bin/bash

# 自动询问是否创建新版本，生成 tag ，更新 version 文件
echo "----- RELEASE -----"

# 自动询问是否创建新版本，生成 tag ，更新 version 文件
LAST_TAG=`git describe --abbrev=0 --tags`;
if [ -z $LAST_TAG ]; then 
  echo "NO TAG,CREATE v1.0.0" 
  LAST_TAG=v1.0.0
else
  echo "LAST TAG IS: $LAST_TAG"
fi
# 计算新TAG版本号
TAG_PRE=`echo $LAST_TAG | sed -n -E "s/(^.*)\..*/\1/gp"`
LAST_NUM=`echo $LAST_TAG |sed -n "s/^.*\.//gp"`
NEW_TAG=$TAG_PRE.$[$LAST_NUM+1]
read -n1 -p "Create New Tag: $NEW_TAG, y OR n :" IS_CRATE_TAG </dev/tty
echo $IS_CRATE_TAG
# 读取用户输入
if [ "$IS_CRATE_TAG"x == "y"x ]; then
  echo "---- CREATE NEW TAG: $NEW_TAG ----"
  echo $NEW_TAG > $PWD/version
  git add $PWD/version
  git commit -a -n -m"NEW TAG:$NEW_TAG"
  git tag -a $NEW_TAG 
  echo "-- PUSH TAG"
  git push --tags --no-verify
  # git tag -a 
fi

exit 0
