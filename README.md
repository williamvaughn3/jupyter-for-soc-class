# JupyterLab Stuff for soc class

Source container is all-spark-notebook.

Inspired by, has content from and based on the following projects:
https://github.com/OTRF/notebooks-forge
https://github.com/philhagen/sof-elk/blob/main/VM_README.md
https://github.com/Cyb3rWard0g/HELK/tree/master/docker
https://github.com/Security-Onion-Solutions/securityonion
and others.

### File Structure

```bash 
├── docker-compose.yaml
├── Dockerfile
├── docker_requirements_os_independant.sh
├── hadoop.tar.gz
├── jars
│   │ ******************************************
│   │               DEPENDENCIES
│   │ ******************************************
├── notebooks
│   ├── hunt
│   │   ├── images
│   │   │   │ ******************************************************
│   │   │   │       Pictures To be used in Mardown Elsewhaere
│   │   │   │ ******************************************************
│   │   ├── pre-hunt
│   │   │   ├──*****************************************************
|   |   |   |               PRE HUNT KNOWLEDGE
│   │   │   ├──*****************************************************
│   │   ├── sigma
│   │   │   ├──*****************************************************
│   │   │   ├                 SIGMA RULES
│   │   │   ├──*****************************************************
│   │   └── windows
│   │   │   ├──*****************************************************
│   │   │   ├             WINDOWS HUNT EXAMPLES
│   │   │   ├──*****************************************************
│   ├── juypter_cmd.sh  # Jupyterlab command to run [TODO]Cleanup this in build
│   ├── library
│   │   ├  *********************************************************
│   │   ├  ├             DOCS, TOOL USAGE AND TUTORIALS 
│   │   ├  *********************************************************
│   │   ├── demos
│   │   │   ├ ******************************************************
│   │   │   ├                   DEMOS
│   │   │   ├ ******************************************************
│   │   ├── linux
│   │   │   ├ ******************************************************
│   │   │   ├              LINUX  KNOWLEDGE 
│   │   │   ├ ******************************************************
│   │   └── windows
│   │       ├ ******************************************************
│   │       ├             WINDOWS  KNOWLEDGE
│   │       ├ ******************************************************
│   └── tutorials
│       ├ **********************************************************
│       ├                   TUTORIALS
│       ├  *********************************************************
│       └── addons
│           ├ ******************************************************
│           ├           JuyputerLab Addon DOCS
│           ├ ******************************************************
|
# BELOW IS REQUIREMENTS THIS DOC AND DEPENDENCIES FOR BUILDING
|
├── README.md
├── requirements.txt
├── shared_dir 
│   │ **************************************************************
│   │         HOST DIR FOR SHARING FILES WITH CONTAINER
│   │ **************************************************************
|   
|
└── spark
    └── spark-defaults.conf
```
