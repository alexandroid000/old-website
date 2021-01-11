git stash
git checkout develop
stack exec site clean
stack exec site build

git fetch --all
git checkout -b master --track origin/master
