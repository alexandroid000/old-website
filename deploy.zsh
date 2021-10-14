git stash
git fetch --all
git checkout master
stack exec myblog clean
stack exec myblog build


if [ $? = 0 ]; then

    #cp -a _site/. .
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
