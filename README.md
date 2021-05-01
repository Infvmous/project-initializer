# Project Initializer

<img src="https://media.giphy.com/media/eOyB8zJsXizkoKyJ4e/giphy.gif" />

## Initial Set Up
1. Clone the repository to directory where you want to store projects
```bash
$ git clone git@github.com:ysomad/project-initializer.git
```
2. Move to project initializer folder
```bash
$ cd /path/to/project-initializer
```
3. Run `setup.sh` and enter github credentials
```bash
$ source setup.sh
Enter GitHub API token(with repo scope): 
Enter your GitHub login: 
```

## Usage
Run projectinit function in the terminal
```bash
$ projectinit {projectname} {editor}
```
- projectname - required
- editor - optional

## TODO
1. Make possible to provide project folder for projectinit() function as parameter with flag
