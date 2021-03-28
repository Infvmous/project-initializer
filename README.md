# Project Initializer

Using this you can create local and remote repos and sync them with just one command

## Initial Set Up
1. Add SSH key to your GitHub account (skip if already did)
2. Clone the repository to a folder when you want to store your projects
```bash
$ git clone git@github.com:Infvmous/project-initializer.git
```
3. Move to project initializer folder
```bash
$ cd /path/to/project-initializer
```
4. Create and activate python virtual environment with name `env`
```bash
$ python -m venv env && source env/bin/activate
```
5. Install dependencies
```bash
$ pip install -r requirements.txt
```
6. Add GitHub API token and login to `setenv.sh`, create [here](https://github.com/settings/tokens/new) with scope `repo`
```bash
export GITHUB_TOKEN='YOUR GITHUB TOKEN'
export GITHUB_LOGIN='YOUR GITHUB LOGIN'
```
7. Run `setup.sh`
```bash
$ source setup.sh
```
8. Deactivate virtual environment
```bash
$ deactivate
```

## Usage
- Simply run `projectinit {your project name}` in the terminal and it will create local and remote repos for you
- If you want to open created project in your code editor add third argument to `projectinit` command
```bash
$ projectinit my_project code
```

