#!/usr/bin/env bash

curl https://raw.githubusercontent.com/creationix/nvm/v0.11.1/install.sh | bash
source ~/.bash_profile
nvm install $1

