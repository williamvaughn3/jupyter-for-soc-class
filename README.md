# JupyterLab Stuff

<u>

## Backrgound
</u>

<i><b> <text style="color:red" align="center"> Dependency Hell is hurtful and true.   </text></i></b>

    Based on all-spark-notebook, but added some stuff like powershell, SplunkSDK, Hadoop, Spark, Elasticsearch/Kibana SDKs, graphviz, matplotlib, maxmind for geoip, and a bunch of other stuff 


    Has a bunch of other sci stuff too, like numpy, pandas, scipy, scikit-learn, etc.   

    Added a bunch of addons to help with things, pdf export nbextensions, nb2py, search, spellcheck, ect, docs for how to use some are in the folders.  Check docker file to see all pip and conda installs
    to get an idea what is in here.
    
<br>

    See the File structure at bottom of this doc for more info
    Example pages from sources for a bunch of add on tools
    Library contains docs, tutorials, and demos for a bunch of stuff
    Notebooks contains a bunch of stuff, hunt, pre-hunt, sigma, windows, linux, etc.

    Good stuff.  Aggregated from multiple sources to include threathunternotbook, HELK, and others

<hr />

## Run it

> May have to run sudo if you haven't did the sudoless docker stuff

`docker-compose up & `

> Will build a custom image.

> Easy way to delete
`docker rm -f $(docker ps -aq)`

**Delete image**

> If you want to keep the source to change shit in the dockerfile; (Keeps you from pulling base image)
`docker image ls | grep -v "all" | awk '{print $3}'`
> 
> Otherwise, just delete 
`docker rmi -f $(docker image ls | awk '{print $3}')`
>


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