#!/bin/bash

chmod +x init.sh
source init.sh

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

INITFILE="init.sh"
EXPORT_PROJECTSDIR_STR="export PROJECTSDIR=$(dirname "$(pwd)")"
SOURCE_PROJECTINITIALIZER_STR="source \$PROJECTSDIR/project-initializer/$INITFILE"

if [[ ! $PROFILE_SHELL =~ ^(unknown|sh)$ ]]; then
    grep -qxF $EXPORT_PROJECTSDIR_STR $SHELLRC || echo $EXPORT_PROJECTSDIR_STR >> $SHELLRC
    grep -qxF $SOURCE_PROJECTINITIALIZER_STR $SHELLRC || echo $SOURCE_PROJECTINITIALIZER_STR >> $SHELLRC
fi


