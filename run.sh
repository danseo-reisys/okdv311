#!/bin/bash

export log=install.log
cd ~

git clone https://github.com/gshipley/installcentos.git

cd installcentos

export INTERACTIVE=false;  echo $INTERACTIVE

export USERNAME=admin; echo $USERNAME
            
export PASSWORD=admin123; echo $PASSWORD
            
export PVS=true; echo $PVS

env > $log

# install OKD
./install-openshift.sh >> $log

# create persistent volumes
/root/okdv311/vol.sh >> $log

exit
