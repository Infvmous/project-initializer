# Project Initializer

<img src="https://i.imgur.com/wWmMbH5.gif" width="600" />

## Initial Set Up
1. Clone the repository to directory where you want to store future projects
```bash
$ git clone git@github.com:ysomad/project-initializer.git
```
2. Move to project initializer folder
```bash
$ cd /path/to/project-initializer
```
3. Add GitHub API token and login to `setenv.sh`, you create token [here](https://github.com/settings/tokens/new) with scope `repo`
```bash
export GITHUB_TOKEN='YOUR GITHUB TOKEN'
export GITHUB_LOGIN='YOUR GITHUB LOGIN'
```
4. Source `setup.sh` which will add paths of projects folder and `init.sh` to .{shell}rc
```bash
$ source setup.sh
```

## Usage
Run projectinit function in the terminal
```bash
$ projectinit {projectname} {editor}
```
- projectname - required
- editor - optional
