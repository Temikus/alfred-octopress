#!/bin/bash

#NOTE:
#Requires terminal-notifier for OS X notifications:
#gem install terminal-notifier

#Path to your octopress installation
octopath='/path/to/your/octopress'

if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
      source "$HOME/.rvm/scripts/rvm"
fi

cd $octopath
rvm use 1.9.3@octopress
rake generate
if [[ $? -eq 0 ]] ; then
    terminal-notifier -message "Blog generated successfully!" -title "Octopress - Alfred"
else
    terminal-notifier -message "Errors while generating static content. Check the console." -title "Octopress - Alfred"
fi