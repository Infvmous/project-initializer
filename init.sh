#!/bin/bash

usage() {
    cat <<EOF
Project initializer script:

OPTIONS:
   -n      project name
   -e      code editor to open newly created project
   -f      path to folder where to create a new project
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
    while getopts ":n:e:f:h" flag; do
        case "${flag}" in
        n) PROJECTNAME="${OPTARG}" ;;
        e) CODE_EDITOR=${OPTARG} ;;
        f) NEW_PROJECT_FOLDER="${OPTARG}" ;;
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

    # cd to project initializer dir to source env variables
    cd $PROJECTSDIR/project-initializer

    # Check if python script executed without errors
    if python3 . $PROJECTNAME $NEW_PROJECT_FOLDER; then
        # Move to created project folder
        cd $NEW_PROJECT_FOLDER/$PROJECTNAME

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
