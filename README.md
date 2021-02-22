# Project Initializer

Using this you can create local and remote repos and sync them with just one command

## Initial Set Up
1. Add SSH key to your GitHub account (skip if already did)
2. Clone the repository
```bash
$ git clone git@github.com:Infvmous/project-initializer.git
```
3. Add GitHub API token and login to `setenv.sh`
```bash
export GITHUB_TOKEN='YOUR GITHUB TOKEN'
export GITHUB_LOGIN='YOUR GITHUB LOGIN'
```
4. Move to project initializer folder
```bash
$ cd /path/to/project-initializer
```
5. Run `setup.sh`
```bash
$ source setup.sh
```

## Usage
Simply run `projectinit {your project name}` in the terminal and it will do everything for you
