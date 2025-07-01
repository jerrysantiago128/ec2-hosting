#!/bin/bash

username=$1
email=$2

if [ "$#" -ne 2 || $1 == "-h" ]; then
	echo "usage: sh 2-setup-git.sh <git.user.name> git.user.email>"
fi

echo "install packages"
sudo yum install -y git tmux
echo "ok"

echo "settings git user.name"
git config --global user.name "$1"
echo "ok"

echo "setting git user.email"
git config --global user.name "$2"
echo "ok"

echo "cloning project 'guideposts98/SWE6733-Group-1'"
git clone git@github.com:guideposts98/SWE6733-Group-1.git
echo "ok"

echo "2-setup-git.sh complete"
