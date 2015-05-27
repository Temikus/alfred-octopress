#!/bin/bash

#Path to your octopress installation
OCTOPATH='/your/path/to/octopress'
#Editor to open the new markdown post in
EDITORAPP='Mou'
#Ruby version from RVM or rbenv
RUBY_VERSION='1.9.3-p551'
#Rbenv location
RBENV_BIN='/usr/local/bin/rbenv'

#Exporting encoding
export 'LC_CTYPE=en_US.UTF-8'

cd $OCTOPATH

#Initialize RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" && rvm use $RUBY_VERSION
#Initialise rbenv
if [[ -s "$RBENV_BIN" ]]; then
  eval "$($RBENV_BIN init -)"
fi

OCTOPOST=$(rake --trace new_post['{query}']| grep -o 'source/_posts/.*')
open -a "$EDITORAPP" $OCTOPATH/$OCTOPOST