git fetch --all
git checkout master
git pull
stack exec site clean
stack exec site build

if [ $? = 0 ]; then

    #cp -a docs/. .
    git add -A
    git commit -m "publish"
    git push origin master:master

else
    echo "Something went wrong"
fi
