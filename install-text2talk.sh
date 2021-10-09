#!/bin/bash
#
# Copyright 2021 Nubonetics Solutions Inc.
# SPDX-License-Identifier: Apache 2.0

mkdir -p ~/.local/share/text2talk
cp define-text2talk.sh ~/.local/share/text2talk
echo "# Added by Text2Talk from eLearningHub: https://github.com/eLearningHub/text2talk" >> ~/.bashrc
echo "source ~/.local/share/text2talk/define-text2talk.sh" >> ~/.bashrc