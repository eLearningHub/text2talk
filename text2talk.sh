#!/bin/bash
#
# Copyright 2021 Nubonetics Solutions Inc.
# SPDX-License-Identifier: Apache 2.0

# [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/eLearningHub/pdf2video/main)
# [![Pangeo](https://binder.pangeo.io/badge.svg)](https://binder.pangeo.io/v2/gh/eLearningHub/pdf2video/main)
#
# # Usage: 
#
# * Install [Docker](https://docs.docker.com/get-docker/)
# * Configure [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) and make sure you have access to [AWS Polly](https://docs.aws.amazon.com/polly/latest/dg/setting-up.html)
# * You need to have a PDF file and the text file for the speech (see the example in this folder: SLIDES.pdf and SLIDES.txt): FILENAME.pdf and FILENAME.txt
# * Run:
# ```
# text2talk.sh FILENAME --voice Matthew --neural --conversational
# ```
# FILENAME.mp4 will be generated in the same path.
#
# For more information about the options and the format of the text file, see [pdf2video](https://github.com/tjunttila/pdf2video).

# FILENAME without the extension
FILENAME=$1
shift
OPTIONS=$@

echo "pdf2video ${FILENAME}.pdf ${FILENAME}.txt ${OPTIONS} ${FILENAME}.mp4"

docker run \
-h text2talk \
--rm \
--name text2talk \
--env COLORFGBG \
--env EMAIL \
--env GIT_AUTHOR_EMAIL \
--env GIT_AUTHOR_NAME \
--env GIT_COMMITTER_EMAIL \
--env GIT_COMMITTER_NAME \
--env SSH_AUTH_SOCK \
--env TERM \
--env USER=${USER} \
--env GROUP=${USER} \
--env USER_ID=`id -u ${USER}` \
--env GROUP_ID=`getent group ${USER} | awk -F: '{printf $$3}'` \
-v /dev:/dev \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v ${PWD}:/home/${USER} \
--env DISPLAY \
--env VIDEO_GROUP_ID=`getent group video | awk -F: '{printf $$3}'` \
-v /dev/dri:/dev/dri \
-v /home/${USER}/.ssh:/home/${USER}/.ssh \
-v /run/user/`id -u ${USER}`/keyring/ssh:/run/user/`id -u ${USER}`/keyring/ssh \
-v /home/${USER}/.aws:/home/${USER}/.aws:ro \
--cap-add=SYS_PTRACE \
--net=host \
--privileged \
--add-host text2talk:127.0.0.1 \
--workdir /home/${USER} \
nubonetics/text2talk:main /bin/bash -c "pdf2video ${FILENAME}.pdf ${FILENAME}.txt ${OPTIONS} ${FILENAME}.mp4"

