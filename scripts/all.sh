#!/bin/bash

chmod +x install_git.sh
chmod +x install_emacs.sh
bash ./install_git.sh
if [ $? -eq 0 ]
then
    echo "########### Successfully Installed Git ###########"
else
    echo "########### Error in Installing Git ###########"
    exit
fi

bash ./install_emacs.sh
if [ $? -eq 0 ]
then
    echo "########### Successfully Installed Emacs24.5 version ###########"
else
    echo "########### Error in Installing Emacs24.5 version ###########"
    exit
fi


