#!/bin/bash

#
# Install Python development tools
#


# Conda ----
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh Miniconda3-latest-Linux-x86_64.sh

conda update conda 
# or for existing conda env:
#> conda update --all --yes
conda --version

# get list of existing conda environments
conda env list

# config conda
conda config --add channels conda-forge
conda config --add channels "Microsoft"
conda config --set channel_priority strict

# add new conda environment and install packages
NEW_CONDA_ENV="<your_data_science_env>"; readonly NEW_CONDA_ENV
conda create -n $NEW_CONDA_ENV python=3.10

conda install -n $NEW_CONDA_ENV conda-tree # NOTE: add required python packages here

# activate new environment
conda activate $NEW_CONDA_ENV

conda info
conda list
conda-tree whoneeds -t scipy

# export new environment
conda env export --no-builds > environment.yml
nano environment.yml


# Install packages ----
cat requirements.txt
pip install -r requirements.txt


# Dev tools ----
# Linters
pip install -U flake8 mypy

# Jupyter
USR="<user_name>"; readonly USR 

curl -fsSL https://deb.nodesource.com/setup_15.x | sudo -E bash -
apt install -y nodejs

nodejs -v

pip install jupyterlab --user $USR
jupyter lab --version

pip install ipywidgets
jupyter labextension install @jupyter-widgets/jupyterlab-manager


# References ----

# 1. https://docs.conda.io/projects/conda/en/latest/user-guide/install/linux.html
