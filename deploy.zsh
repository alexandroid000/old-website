git fetch --all
git checkout master
git pull
stack exec myblog clean
stack exec myblog build

if [ $? = 0 ]; then

    cp CNAME docs/
    git add -A
    git commit -m "publish"
    git push origin master:master

else
    echo "Something went wrong"
fi
