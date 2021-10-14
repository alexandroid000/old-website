git stash
git checkout develop
stack exec site clean
stack exec site build

git fetch --all

echo "MOVING TO MASTER BRANCH"

git checkout -b master --track origin/master

if [ $? = 0 ]; then

    #cp -a docs/. .
    git add -A
    git commit -m "publish"
    git push origin master:master

    echo "MOVING BACK TO DEVELOP"
    git checkout develop
    git branch -D master
    git stash pop
else
    echo "Something went wrong"
fi
