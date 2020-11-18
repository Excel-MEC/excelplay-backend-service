from fabric.api import *

PROJECT_BASE = "/home/excel/excelplay-backend-service/"

def deploy():
    print("here")
    with cd(PROJECT_BASE):
        print("inside context manager")
        # run("docker-compose down")
        # run("git pull origin master --rebase")
        # run("docker-compose -f prod.docker-compose.yml up --build")