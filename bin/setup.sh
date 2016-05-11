#!/bin/bash

# install rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
~/.rbenv/bin/rbenv init
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# source profile so we can use rbenv
. ~/.bash_profile

# install ruby 2.2.2 as global version
rbenv install 2.2.2
rbenv global 2.2.2

# project setup
gem install bundler
bundle install

# rbenv shims
rbenv rehash
