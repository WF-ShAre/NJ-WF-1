wf=$1
#!/bin/bash

#install wget
Wget=$(which wget)
#echo "${Dock}"
if [[ -z ${Wget} ]]; then
   echo "wget installation"
   sudo apt-get install -y wget
fi

#Docker & Cloudify installation
if [[ ! -f  tools-install.sh ]]; then
  wget https://github.com/WorkflowCenter-Repositories/ToolsInstallationScripts/raw/master/tools-install.sh
  chmod u+x tools-install.sh
fi

. ./tools-install.sh

sudo service docker start

echo "deploy the workflow"
if [[ ${wf} == 1 ]]; then
   if [[ -d ~/realeScWF-inhost ]]; then
      echo "previous workflow execution exists and will be deleted"
      rm -rf ~/realeScWF-inhost
   fi
  cfy local init --install-plugins -p realeScWF-inhost.yaml --input input.yaml
else
   if [[ -d ~/realeScWF-1host ]]; then
      echo "previous workflow execution exists and will be deleted"
      rm -rf ~/realeScWF-1host
   fi
  cfy local init --install-plugins -p realeScWF-1host.yaml -i input.yaml
fi

cfy local execute -w install


