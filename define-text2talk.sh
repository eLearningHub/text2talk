#!/bin/bash
#
# Copyright 2021 Nubonetics Solutions Inc.
# SPDX-License-Identifier: Apache 2.0

function text2pdf {
ARGS=$@
echo pandoc $ARGS
docker run \
-h text2talk \
--detach \
--name text2talk \
--env COLORFGBG \
--env EMAIL \
--env TERM \
--env USER=${USER} \
--env GROUP=${USER} \
--env USER_ID=`id -u ${USER}` \
--env GROUP_ID=`getent group ${USER} | awk -F: '{printf $3}'` \
-v ${PWD}:/workspace \
--env DISPLAY \
--env VIDEO_GROUP_ID=`getent group video | awk -F: '{printf $3}'` \
-v /home/${USER}/.aws:/home/${USER}/.aws:ro \
--cap-add=SYS_PTRACE \
--net=host \
--privileged \
--add-host text2talk:127.0.0.1 \
nubonetics/text2talk:latest >> /dev/null
sleep 1
docker exec -t --env COLORFGBG --env TERM -u ${USER} text2talk /bin/bash -lc "cd /workspace; pandoc $ARGS"
docker stop text2talk >> /dev/null
docker rm text2talk >> /dev/null
}

export -f text2pdf

function pdf2talk {
ARGS=$@
echo pdf2video $ARGS
docker run \
-h text2talk \
--detach \
--name text2talk \
--env COLORFGBG \
--env EMAIL \
--env TERM \
--env USER=${USER} \
--env GROUP=${USER} \
--env USER_ID=`id -u ${USER}` \
--env GROUP_ID=`getent group ${USER} | awk -F: '{printf $3}'` \
--env AWS_ACCESS_KEY_ID \
--env AWS_SECRET_ACCESS_KEY \
--env AWS_DEFAULT_REGION \
--env AWS_REGION \
--env AWS_PROFILE \
-v ${PWD}:/workspace \
--env DISPLAY \
--env VIDEO_GROUP_ID=`getent group video | awk -F: '{printf $3}'` \
-v /home/${USER}/.aws:/home/${USER}/.aws:ro \
--cap-add=SYS_PTRACE \
--net=host \
--privileged \
--add-host text2talk:127.0.0.1 \
nubonetics/text2talk:latest >> /dev/null
sleep 1
docker exec -t --env COLORFGBG --env TERM -u ${USER} text2talk /bin/bash -lc "cd /workspace; pdf2video $ARGS"
docker stop text2talk >> /dev/null
docker rm text2talk >> /dev/null
}

export -f pdf2talk
