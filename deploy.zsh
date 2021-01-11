git stash
git checkout develop
stack exec site clean
stack exec site build

git fetch --all
git checkout -b master --track origin/master

echo $?

if [ $? = 0 ]; then

    cp -a _site/. .
    git add -A
    git commit -m "publish"
    git push origin master:master

    git checkout develop
    git branch -D master
    git stash pop
else
    echo "Something went wrong"
fi
