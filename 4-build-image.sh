#!/bin/bash

cd compose/
docker build -t rovaly-web-app:0.0.1 .
cd ..
echo "NEW IMAGE BUILT SUCCESSFULLY"
echo "run 5-deploy-services.sh to start service suite"
