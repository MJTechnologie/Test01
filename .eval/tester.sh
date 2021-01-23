if [ -d $1/$2 ]
then
  if [ -d $3 ]
  then
    user_score=0
    user_score=`expr $user_score + 1`
    if [ $user_score -eq 1 ]
    then
      echo 'Preliminary local directory checks in local repository... Pass'
    else
      echo 'Preliminary local directory checks in local repository... Fail'
    fi
    cd $1
    git checkout master > /dev/null 2>&1
    [ `eval git log --pretty="oneline" | wc -l` -ge 2 ] && echo 'Commits check on master... Pass' || echo 'Commits check on master... Fail'
    [ `eval git remote -v | grep "origin" | wc -l` -ge 2 ] && echo 'remote added... Pass' || echo 'remote added ... Fail'
    cd ..
    cd $3
    [ `eval cat hello-world/hello-world.py | grep "print'(Hello world)'" | wc -l` -ge 1 ] && echo 'clone check... Pass' || echo 'clone check... Fail'
    cd ..
    cd $5
    [ `eval git log --pretty="oneline" | wc -l` -ge 2 ] && echo 'cloning remote... Pass' || echo 'cloning remote... Fail'
    cd ..
  else
    echo 'No local directory found...'
  fi
  if [ -d $4/$5 ]
  then
    user_score=0
    user_score=`expr $user_score + 1`
    cd $4
    git clone $5 $6 > /dev/null 2>&1
    user_score=`expr $user_score + 1`
    if [ $user_score -eq 2 ]
    then
      echo 'Preliminary remote directory checks in local repository... Pass'
    else
      echo 'Preliminary remote directory checks in local repository... Fail'
    fi
    cd $6
    [ `eval git log --pretty="oneline" | wc -l` -ge 2 ] && echo 'Commits check on master... Pass' || echo 'Commits check on master... Fail'
    [ `eval git remote -v | grep "origin" | wc -l` -ge 2 ] && echo 'remote added... Pass' || echo 'remote added ... Fail'
    cd ../..
    rm -rf $4/$6
  else
    echo 'No remote directory found...'
  fi
else
  echo 'No git found in the local directory'
fi