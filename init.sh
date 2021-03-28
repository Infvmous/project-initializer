#!/bin/bash

projectinit() {
    PROJECTNAME=$1

    # cd to project initializer dir to source env variables
    cd $PROJECTSDIR/project-initializer
    source setenv.sh

    # Check if python script executed without errors
    if python3 . $PROJECTNAME; then
        # Move to created project folder
        cd $PROJECTSDIR/$PROJECTNAME

        # GitHub quick setup
        echo "# $PROJECTNAME" >> README.md
        git init
        git add README.md
        git commit -m "initial commit"
        git branch -M main
        git remote add origin git@github.com:$GITHUB_LOGIN/$PROJECTNAME.git
        git push -u origin main

        # Open code editor in created project folder
        # $2 - argument for code editor
        if [ ! -z "$2" ]; then
            $2 .
        fi

        echo "success"
    else
        echo "failure: $?"
    fi
}
