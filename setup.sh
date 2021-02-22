#!/bin/bash

chmod +x main.sh
source main.sh


# Check what shell current profile is using
if test -n "$ZSH_VERSION"; then
  PROFILE_SHELL=zsh
elif test -n "$BASH_VERSION"; then
  PROFILE_SHELL=bash
elif test -n "$KSH_VERSION"; then
  PROFILE_SHELL=ksh
elif test -n "$FCEDIT"; then
  PROFILE_SHELL=ksh
elif test -n "$PS3"; then
  PROFILE_SHELL=unknown
else
  PROFILE_SHELL=sh
fi

SHELLRC="${HOME}/.${PROFILE_SHELL}rc"

if [[ ! $PROFILE_SHELL =~ ^(unknown|sh)$ ]]; then
    grep -qxF "export PROJECTINITPATH=$PWD" $SHELLRC || echo "export PROJECTINITPATH=$PWD" >> $SHELLRC
    grep -qxF 'source $PROJECTINITPATH/main.sh' $SHELLRC || echo 'source $PROJECTINITPATH/main.sh' >> $SHELLRC
    grep -qxF "export PROJECTSDIR=$(dirname "$(pwd)")" $SHELLRC || echo "export PROJECTSDIR=$(dirname "$(pwd)")" >> $SHELLRC
fi


