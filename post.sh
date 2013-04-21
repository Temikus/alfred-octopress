#!/bin/bash

#Path to your octopress installation
OCTOPATH='/your/path/to/octopress'
#Editor to open the new markdown post in
EDITORAPP=Mou

if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then

      source "$HOME/.rvm/scripts/rvm"
fi

#Exporting encoding
export 'LC_CTYPE=en_US.UTF-8'

cd $OCTOPATH
rvm use 1.9.3@octopress
OCTOPOST=$(rake new_post['{query}']| grep -o 'source/_posts/.*')
open -a "$EDITORAPP" $OCTOPATH/$OCTOPOST