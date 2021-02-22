#!/bin/bash

projectinit() {
    PROJECTNAME=$1
    
    # cd to project initializer dir to source env variables
    # cd $PROJECTINITPATH
    cd $PROJECTSDIR/project-initializer
    source setenv.sh

    # Activate pyenv
    source env/bin/activate

    # Check if python script executed without errors
    if python . $PROJECTNAME; then
        # cd to projects directory
        cd $PROJECTSDIR/$PROJECTNAME

        # GitHub quick setup
        touch README.md
        git init
        git add README.md
        git commit -m "initial commit"
        git branch -M main
        git remote add origin git@github.com:$GITHUB_LOGIN/$PROJECTNAME.git
        git push -u origin main

        # Open code editor in created project folder
        # vim .
        code .
        # atom .
        # etc

        echo "success"
    else
        echo "failure: $?"
    fi

    # Deactivate pyenv
    deactivate
}
