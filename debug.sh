#!/bin/bash

#NOTE
#This is a debug version of the script. 
#You can use it to collect debugging information from rake if something goes wrong.
#####

#Path to your octopress installation
OCTOPATH='/your/path/to/octopress'
#Editor to open the new markdown post in
EDITORAPP=Mou
#Path to write traces to
TRACEPATH='~/Desktop'

pwd >> $TRACEPATH/op_trace.log

echo {query} >> $TRACEPATH/op_trace.log

if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then

      source "$HOME/.rvm/scripts/rvm"
fi

#Exporting encoding
export 'LC_CTYPE=en_US.UTF-8'

cd $OCTOPATH
rvm use 1.9.3@octopress
pwd >> $TRACEPATH/op_trace.log
OCTOPOST=$(rake -t new_post['{query}'] 2>&1 | tee $TRACEPATH/op_trace.log/op_rake.log | grep -o 'source/_posts/.*')
open -a "$EDITORAPP" $OCTOPATH/$OCTOPOST