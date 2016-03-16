# NJ-WF information

![myimage-alt-tag](https://github.com/WorkflowCenter-Repositories/NJ-WF/raw/master/WF%20structure.png)


  WF-Title: Neighbour Joining
  version: 1.0
  Description: The workflow performs identification of Leishmania species using the neighbour joining method. It was designed in the e-Science Central system.
  instruction-file: NJ-instruction
  WF-Diagram: JN-png

###WF-Tasks:

  No-of-tasks: 11
  Tasks: {importFile: 2, filejoin: 1, filterDuplicate: 1, clustalw: 1, Mega-NJ: 1, exportFile: 3, csvExport: 2}
  Dependency-Libs: {java1.7: all, clustalw-lib: clustalw, wine1.6: Mega-NJ, Mega-CC: Mega-NJ} 

###Blueprint:

  blueprint-name: realeScWF-inhost.yaml
  Docker-images: rawa/nj 
  sizes: 563 MB (Virtual size 1.421 GB)
  OS-types: ubuntu14.4
  tools: 

###Input:

  input-file(s): {'file1', 'file2'}
  description: Two files for the two importfile tasks
  types: 

###Outputs:

  output-folder: '~/blueprint-name'
  output-file(s): {'analysis-output', 'consensus-output', 'summary-info', 'removed-sequences', 'sequence-map'}
  description:
  types: {' ', ' ', ' ', csv-file, csv-file}

###Execution-Environment:

  Cloudify-version: 3.2
  Docker-version: 1.8+
  OS-type: ubuntu14.04
  Disk-space: 10 GB
  RAM: 3 GB

#Deployment Instruction
This repository includes all files and scripts to deploy Nieghbour Joining workflow on Multiple Docker containers as follow:

1- Clone the repository to your machine, open a terminal window and change to workflow repository.  
2- To execute the workflow with multi containers and the attached input sample, in the terminal run:   
   . ./NJ-deploy.sh 1    
3- If you have own input files, copy your files to NJ/Input-sample folder, open Input.yaml file and change input files name, then
   run:  
   . ./NJ-deploy.sh 1  
  
4- To execute the workflow with single container, follow either step 2 or 3 but run:    
   . ./NJ-deploy 2  
    
After successfully running the workflow, five output files can be found in ~/realeScWF-inhots folder
