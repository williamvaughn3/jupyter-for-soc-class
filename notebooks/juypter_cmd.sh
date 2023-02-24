#!/bin/bash

NOTEBOOK_INFO_TAG="[NOTEBOOK-JUPYTER-DOCKER-INSTALLATION-INFO]"
NOTEBOOK_ERROR_TAG="[NOTEBOOK-JUPYTER-DOCKER-INSTALLATION-ERROR]"
params=()

if [[ -z "$JUPYTER_TYPE" ]]; then
    JUPYTER_TYPE="notebook"
fi
if [[ "$JUPYTER_CONFIG" ]]; then
    params+=("--config=$JUPYTER_CONFIG")
else
    if [[ -z "$JUPYTER_IP" ]]; then
        JUPYTER_IP=0.0.0.0
    fi
    params+=("--ip=$JUPYTER_IP")

    if [[ -z "$JUPYTER_PORT" ]]; then
        JUPYTER_PORT=8888
    fi
    params+=("--port=$JUPYTER_PORT")
    if [[ -z "$JUPYTER_NOTEBOOKS_DIR" ]]; then
        JUPYTER_NOTEBOOKS_DIR=/opt/jupyter/notebooks
    fi
    params+=("--notebook-dir=$JUPYTER_NOTEBOOKS_DIR")
    params+=("--no-browser --allow-root")
    if [[ -z "$JUPYTER_MAX_BUFFER_SIZE" ]]; then
        JUPYTER_MAX_BUFFER_SIZE="536870912"
    fi
    params+=("--NotebookApp.max_buffer_size=$JUPYTER_MAX_BUFFER_SIZE")
    if [[ "$JUPYTER_TYPE" == "notebook" ]]; then
        if [[ -z "$JUPYTER_BASE_URL" ]]; then
            JUPYTER_BASE_URL="/"
        fi
        params+=("--NotebookApp.base_url=$JUPYTER_BASE_URL")
    elif [[ "$JUPYTER_TYPE" == "lab" ]]; then
        if [[ -z "$JUPYTER_BASE_URL" ]]; then
            JUPYTER_BASE_URL="/"
        fi
        params+=("--LabApp.base_url=$JUPYTER_BASE_URL")
    else
        echo "$NOTEBOOK_ERROR_TAG You did not enter a valid Jupyter type:  $JUPYTER_TYPE.."
        exit 1
    fi
fi
echo "$NOTEBOOK_INFO_TAG Running Jupyter Type: $JUPYTER_TYPE.."
echo "$NOTEBOOK_INFO_TAG Running the following parameters ${params[@]}"
echo "$NOTEBOOK_INFO_TAG Starting Jupyter $JUPYTER_TYPE.."
if [[ "$JUPYTER_TYPE" == "notebook" ]]; then
    jupyter notebook ${params[@]}
elif [[ "$JUPYTER_TYPE" == "lab" ]]; then
    jupyter lab ${params[@]}
fi
