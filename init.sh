#!/bin/bash

usage() {
    cat <<EOF
usage: init [options] [<projectname>] 

options:
   -e      code editor to open newly created project
   -p      path to folder where to create a new project

EOF
}

init() {
    NEW_PROJECT_FOLDER=$PROJECTSDIR

    # exit if no values passed to flag
    if [ $# -eq 0 ]; then
        usage
        exit 0
    fi

    # setup flags
    while getopts ":e:p:h" flag; do
        case "${flag}" in
        e) CODE_EDITOR=${OPTARG} ;;
        p) NEW_PROJECT_FOLDER="${OPTARG}" ;;
        h) 
            usage 
            exit 0
            ;;
        *)
            usage
            exit 0
            ;;
        esac
    done
    shift $((OPTIND - 1))

    PROJECTNAME=$1

    # cd to project initializer dir to source env variables
    cd $PROJECTSDIR/project-initializer

    # Check if python script executed without errors
    if python3 . $PROJECTNAME $NEW_PROJECT_FOLDER; then
        PATH_TO_PROJECT="$NEW_PROJECT_FOLDER/$PROJECTNAME"
        # Move to created project folder if its exists
        if [ -d "$PATH_TO_PROJECT" ]; then
            cd $PATH_TO_PROJECT
        else
            echo "Folder ${PATH_TO_PROJECT} doesn't exist\n"
            usage
            exit 0
        fi

        # GitHub initialize new repo
        echo "# $PROJECTNAME" >> README.md
        git init
        git add README.md
        git commit -m "initial commit"
        git branch -M main
        git remote add origin git@github.com:$GITHUB_LOGIN/$PROJECTNAME.git
        git push -u origin main

        # Open created project folder in editor
        if [ ! -z "$CODE_EDITOR" ]; then
            $CODE_EDITOR .
        fi

        echo "success"
    else
        echo "failure: $?"
    fi
}
