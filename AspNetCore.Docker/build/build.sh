#!/bin/bash

echo Linux Docker build

cd ../AspNetCore.Docker

dotnet publish -c Release -o ../publish

cd ../publish

echo publish success

read -p "Press any key to continue."

ssh -p 22 root@192.168.163.128 "mkdir -p /data/websites/app"

# 发布
scp -P 22 -r ../publish/* root@192.168.163.128:/data/websites/app

read -p "Press any key to continue."

ssh -p 22 root@192.168.163.128 "docker build -t aspnetcoredocker -f /data/websites/app/Dockerfile /data/websites/app"

ssh -p 22 root@192.168.163.128 "docker run --name=mydockertest -p 8080:8080 -d  aspnetcoredocker"