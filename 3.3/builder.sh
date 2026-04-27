#!/bin/bash

# remote repo
remote_repo="https://github.com/"$1
# local repo
local_repo=$(echo "$1" | cut -d'/' -f2)
# clone remote repo
git clone $remote_repo
# move to local repo
cd $local_repo
# build image
docker build -t $local_repo .
# tag image
docker tag $local_repo $2
# push to docker hub
docker push $2
# show message its completed
echo "done"
