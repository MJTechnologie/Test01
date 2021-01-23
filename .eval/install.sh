#!/bin/bash
created=0
[ -d $1 ] && created=1 || mkdir $1
[ -d $1/$2 ] && created=2 || mkdir $1/$2
if [ $created -lt 2 ]
then
  cd $1/$2
  git init --bare > /dev/null 2>&1
  cd ../..
fi
mkdir test
if [ -d test ]
then
  cd test
  echo 'Staging Area' > staging.txt
  cd ..
fi
mkdir clone
if [ -d clone ]
then
  cd clone
  git init > /dev/null 2>&1
  cd ..
fi