#!/bin/bash

# Install dependencies:
echo 'Installing prerequisites...'
sudo apt-get install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config
echo 'Done.'

# Install stable rvm version:
echo 'Installing RVM stable...'
\curl -L https://get.rvm.io | bash -s stable
echo 'Done.'

# Start using RVM:
echo 'Adding source to .bashrc...'
if grep -Fxq '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"' ~/.bashrc
then
	echo 'Skipped: rvm found on .bashrc'
else
	echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"' >> ~/.bashrc
	echo 'Done.'
fi

echo 'Loading RVM...'
source ~/.rvm/scripts/rvm
echo 'Done.'

# Install ruby:
echo 'Installing Ruby 1.9.3...'
rvm install ruby-1.9.3
rvm use 1.9.3
echo 'Done.'

# Install rails:
echo 'Installing Rails...'
gem install rails
echo 'Done.'

# Install javascript runtime:
echo 'Installing Javascript runtime for execjs: Nodejs...'
sudo apt-get install software-properties-common
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs npm
echo 'Done.'

echo 'Quickstart completed.'
echo 'Please reopen all your shell windows!'
