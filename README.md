# Project Initializer

[![demo](https://asciinema.org/a/423716.svg)](https://asciinema.org/a/423716?autoplay=1)

## Initial Set Up
1. Clone the repository
```bash
$ git clone git@github.com:ysomad/project-initializer.git
```
2. Move to project initializer folder
```bash
$ cd /path/to/project-initializer
```
3. Run `setup.sh` and enter GitHub API token and username
```bash
$ source setup.sh
Enter GitHub API token(with repo scope): 
Enter GitHub username: 
```

## Usage
Run `init` in the terminal with or without optional arguments
- Without optional arguments
```bash
$ init projectname
```
- Specifying path where project will be created
```bash
$ init -p /Users/alex/Desktop projectname
```
By default all projects will be created in the same directory where project-initializator was cloned
- Specifying code editor in which folder with project will open after creation (VS Code for example)
```bash
$ init -e code projectname
```

### Options
Option | Description
------------ | -------------
-f | path to folder where to create a new project
-e | code editor to open newly created project 
