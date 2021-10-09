#!/bin/bash
#
# Copyright 2021 Nubonetics Solutions Inc.
# SPDX-License-Identifier: Apache 2.0

curl -o ~/.local/share/text2talk/define-text2talk.sh --create-dirs https://raw.githubusercontent.com/eLearningHub/text2talk/main/define-text2talk.sh 
cp define-text2talk.sh ~/.local/share/text2talk
echo "# Added by Text2Talk from eLearningHub: https://github.com/eLearningHub/text2talk" >> ~/.bashrc
echo "source ~/.local/share/text2talk/define-text2talk.sh" >> ~/.bashrc