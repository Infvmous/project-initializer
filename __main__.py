import sys
import os
import json

import requests


def create_project_folder(folder_name):
    """Creating project folder in projects folder"""
    try:
        os.mkdir(f'{os.getenv("PROJECTSDIR")}/{folder_name}')
        print(f'Directory {folder_name} created')
    except FileExistsError:
        sys.exit(f'Directory {folder_name} already exists')


def handle_response(response):
    """Raise SystemExit exception if response status code is not OK
    and show json data from response"""
    if response.status_code != 200:
        sys.exit(response.json())


def create_github_project_repository(repository_name):
    """Creating github repository with repository_name using github api"""
    response = requests.post('https://api.github.com/user/repos',
            headers={'Authorization': f'token {os.getenv("GITHUB_TOKEN")}'},
            data=json.dumps({'name': repository_name}))
    data = response.json()
    if response.status_code != 201:
        sys.exit(data)
    print(f'GitHub repository {data["name"]} created at {data["html_url"]}')


def main(project_name):
    create_project_folder(project_name)
    create_github_project_repository(project_name)


if __name__ == '__main__':
    try:
        main(sys.argv[1])
    except IndexError:
        sys.exit(f'Project name argument is missing at index 1 in {sys.argv}')
