user_score=0

if [ -d $1/$2 ]
then
  if [ -d $3 ]
  then
    cd $1
    git checkout master > /dev/null 2>&1
    [ `eval git log --pretty="oneline" | wc -l` -ge 2 ] && user_score=`expr $user_score + 1`
    [ `eval git remote -v | grep "origin" | wc -l` -ge 2 ] && user_score=`expr $user_score + 1`
    cd ..
    cd $3
    [ `eval cat hello-world/hello-world.py | grep "print'(Hello world)'" | wc -l` -ge 1 ] && user_score=`expr $user_score + 1`
    cd ..
    cd $5
    [ `eval git log --pretty="oneline" | wc -l` -ge 2 ] && user_score=`expr $user_score + 1`
    cd ..
  fi
  if [ -d $4/$5 ]
  then
    user_score=`expr $user_score + 1`
    cd $4
    git clone $5 $6 > /dev/null 2>&1
    cd $6
    [ `eval git log --pretty="oneline" | wc -l` -ge 2 ] && user_score=`expr $user_score + 1`
    [ `eval git remote -v | grep "origin" | wc -l` -ge 2 ] && user_score=`expr $user_score + 1`
    cd ../..
    rm -rf $4/$6
  fi
fi

percent_score=$(( user_score * 100 / 7 ))
echo "Points scored: $user_score/7"
echo "FS_SCORE:$percent_score%"
