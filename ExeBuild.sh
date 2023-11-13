#!/bin/bash
set -euxo pipefail #for bash

# 檢查要輸入三個參數
if [ -z "$1" ] || [ -z "$2" ]|| [ -z "$3" ]; then
    echo -e "build need 3 arguments \nsh ExeBuild.sh [DockerRepo] [RepoVersion] [APP_NAME]"
    exit 1
fi

REPOSITORY_URI=$1
REPO_VERSION=$2
APP_NAME=$3

# 使用Dockerfile建立image
docker build --compress --force-rm --squash --build-arg APP_NAME=${APP_NAME} \
    -t ${REPOSITORY_URI}:${REPO_VERSION} \
    -f BuildExeDockerfile .

# 使用建好的docker image建立一個臨時的容器
docker create --name temp-container ${REPOSITORY_URI}:${REPO_VERSION}

# 將臨時容器裡的執行檔複製到當前的目錄
docker cp temp-container:/Source/${APP_NAME} ./${APP_NAME}     

# 移除臨時的容器
docker rm temp-container