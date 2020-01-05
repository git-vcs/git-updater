# git-updater
This is a simple Linux script to update an git based project on a headless server. The script is designed to run with crontab but can also be run manually(however that defeats the purpose of the script).


## Setup:
### Folderstructure:
    git-updater
    the_project_you_want_to_update
    
### Configure:

You need to configure the ABSOLUTE path to your project-directory (DIR variable line 3).
And the name or command to start your project(RUNFILE variable line 6).



The script does 4 things.
1. checks the git status. And If there is an update...
2. Stops the project.
3. Downloads the new version.
4. Starts the project.
