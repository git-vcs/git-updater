#!/bin/bash
#absolute path to directory
DIR="";

#name or command to start your project
RUNFILE="";

#process that you wont to exit before downloading updates
STOPPROGRAM="screen";
PROSESS=$(pgrep $STOPPROGRAM);

GITRESPONS="";#don't change this value

check_git(){
  git remote update
GITRESPONS=$(git status |grep "behind");
echo ${#GITRESPONS}
}

goToProjecktFolder(){
  echo "going to folder $DIR"
  cd ..
  cd $DIR
}

run_program(){
  sleep 5
  echo "antall prosesser "${#PROSESS}
  echo "Staring $RUNFILE"
  screen -d -m ./$RUNFILE
}

#program starts here
goToProjecktFolder
check_git

if [[ ${#GITRESPONS} -gt 0 ]]; then
  echo "there is an update"
  pkill $STOPPROGRAM

  git pull origin master
sleep 5
  run_program
else
  echo "there is no update"
  if [[ ${#PROSESS} -gt 0 ]]; then
    echo "program alreddy running"
  else
    run_program
  fi

fi
echo "exiting updater.sh"
