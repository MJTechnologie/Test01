git clone $1/$2
if [ -d $2 ]
then
  cd $2
  touch newfile1.txt
  git add .
  git commit -m "Added newfile1" > /dev/null 2>&1
  git push origin master
fi