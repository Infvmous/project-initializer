#!/bin/sh

echo -n "Enter GitHub API token(with repo scope): "
read GITHUB_TOKEN

echo -n "Enter your GitHub login: "
read GITHUB_LOGIN

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

EXPORT_GITHUB_TOKEN_STR="export GITHUB_TOKEN=$GITHUB_TOKEN"
EXPORT_GITHUB_LOGIN_STR="export GITHUB_LOGIN=$GITHUB_LOGIN"

if [[ ! $PROFILE_SHELL =~ ^(unknown|sh)$ ]]; then
	grep -qxF $EXPORT_PROJECTSDIR_STR $SHELLRC || echo $EXPORT_PROJECTSDIR_STR >> $SHELLRC
	grep -qxF $SOURCE_PROJECTINITIALIZER_STR $SHELLRC || echo $SOURCE_PROJECTINITIALIZER_STR >> $SHELLRC
	grep -qxF $EXPORT_GITHUB_TOKEN_STR $SHELLRC || echo $EXPORT_GITHUB_TOKEN_STR >> $SHELLRC
	grep -qxF $EXPORT_GITHUB_LOGIN_STR $SHELLRC || echo $EXPORT_GITHUB_LOGIN_STR >> $SHELLRC
fi


