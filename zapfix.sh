#!/bin/bash

docker exec -u 0 -it zapgui usermod -o -u 0 zap
docker exec -u 0 -it zapgui sed -i 's/xvfb-run $SCRIPTPATH$0 run/xvfb-run -a $SCRIPTPATH$0 run/' zap-webswing.sh 
echo "zapgui has been updated!"