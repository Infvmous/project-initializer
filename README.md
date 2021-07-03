# Project Initializer

<img src="https://media.giphy.com/media/eOyB8zJsXizkoKyJ4e/giphy.gif" />

## Initial Set Up
1. Clone the repository
```bash
$ git clone git@github.com:ysomad/project-initializer.git
```
2. Move to project initializer folder
```bash
$ cd /path/to/project-initializer
```
3. Run `setup.sh` and enter github API token and github login
```bash
$ source setup.sh
Enter GitHub API token(with repo scope): 
Enter your GitHub login: 
```

## Usage
Run `init` in the terminal
```bash
$ init -n projectname -f /path/to/ -e code
```
### Options
- -n - project name
- -e - code editor to open newly created project
- -f - path to folder where to create a new project
