#!/bin/bash

######
# This script synchronizes AAP common content to the downstream repository.
# There is a Jenkins job that configures the source and target repositories and runs this script directly.
# If you commit changes to this script you should verify the Jenkins job runs successfully.
######

# Set the path to the source and target directories.
# The source directory contains the content that you want to synchronize.
source=source
# The target directory is the location where you want to synchronize content.
target=target

# Clean the existing AAP common content folder.
rm -rf $target/aap-common

# Copy the content of the AAP common content folders.
cp -r $source/aap-common $target/aap-common
