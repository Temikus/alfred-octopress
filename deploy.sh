#!/bin/bash

#Path to your octopress installation
OCTOPATH='/your/path/to/octopress'

if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
      source "$HOME/.rvm/scripts/rvm"
fi

cd $OCTOPATH >> /dev/null
rvm use 1.9.3@octopress >> /dev/null
rake deploy >> /dev/null

if [[ $? -eq 0 ]] ; then
    echo "Blog deployed successfully!"
else
    echo "Errors while executing deploy task. Check the console."
fi