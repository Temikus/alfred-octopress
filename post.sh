#!/bin/bash

#Path to your octopress installation
octopath='/path/to/your/octopress'
#Editor to open the new markdown post in
editorapp=Mou

if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then

      source "$HOME/.rvm/scripts/rvm"
fi

cd $octopath
rvm use 1.9.3@octopress
octopost=$(rake -t new_post['{query}'] 2>&1 | tee ~/Desktop/op_trace.log | grep -o 'source/_posts/.*')
open -a "$editorapp" $octopath/$octopost