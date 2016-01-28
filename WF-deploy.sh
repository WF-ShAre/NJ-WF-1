wf=$1
#!/bin/bash

sudo service docker start

echo "deploy the workflow"
if [[ ${wf} == 1 ]]; then
   if [[ -d ~/realeScWF-inhost ]]; then
      echo "previous workflow execution exists and will be deleted"
      rm -r ~/realeScWF-inhost
   fi
  cfy local init --install-plugins -p realeScWF-inhost.yaml --input input.yaml
else
   if [[ -d ~/realeScWF-1host ]]; then
      echo "previous workflow execution exists and will be deleted"
      rm -r ~/realeScWF-1host
   fi
  cfy local init --install-plugins -p realeScWF-1host.yaml -i input.yaml
fi


cfy local execute -w install
