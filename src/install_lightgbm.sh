#!/bin/bash

#
# Install LightGBM script
# 


# Install dependecies ----
apt install -y ocl-icd-opencl-dev libboost-dev libboost-system-dev libboost-filesystem-dev


# Install LightGBM ----

# WARN: go to RStudio terminal

# clone LightGBM
git clone --recursive https://github.com/Microsoft/LightGBM

cd LightGBM
Rscript build_r.R --use-gpu
cd ~


# Validate installation ----
# if nessary: install.packages("lightgbm", destdir = "/home/dp/apps/LightGBM/build")
Rscript -e "library(lightgbm)"


# References ----
# 1. https://lightgbm.readthedocs.io/en/latest/Installation-Guide.html#id17
# 2. https://github.com/Microsoft/LightGBM/blob/master/docs/Installation-Guide.rst#build-gpu-version
