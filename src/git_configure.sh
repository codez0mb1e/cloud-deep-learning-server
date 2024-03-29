#!/bin/bash

#
# Configure git
#


# 0. Set params ----
USER_NAME="<name>"; readonly USER_NAME
USER_EMAIL="<email>"; readonly USER_EMAIL


# 1. Config git ----
git config --global user.name $USER_NAME
git config --global user.email $USER_EMAIL
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'

git config --list


# 2. Set SSH key to github ----

# check existing SSH keys and its permissions [3]
ls -l ~/.ssh/*

# generate new keys pair (if nessary)
ssh-keygen -C $USER_NAME

 # register public keys [2]
cat ~/.ssh/id_rsa.pub


# 3. Validate ----
# Prepare to clone repos
mkdir ~/repos && cd ~/repos

# Now you can clone repo (for example this repo):
git clone git@github.com:codez0mb1e/cloud-rstudio-server.git


# 3. Commit signature verification [4] ----
# Check GPG version
gpg --version # shoul be >= 2.1
echo "test" | gpg --clearsign

# Get list of existing keys
gpg --list-secret-keys --keyid-format=long
# or generate new one
gpg --full-generate-key

# Export public key
# Open https://github.com/settings/gpg/new and paste you GPG key id from:
gpg --armor --export <gpg_key_id>

# Configure git to use GPG key
git config --global user.signingkey <gpg_key_id>
git config --global commit.gpgsign true

[ -f ~/.bashrc ] && echo 'export GPG_TTY=$(tty)' >> ~/.bashrc


# References ----
# 1. https://happygitwithr.com/push-pull-github.html
# 2. https://github.com/settings/keys
# 3. https://superuser.com/questions/215504/permissions-on-private-key-in-ssh-folder
# 4. https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification
