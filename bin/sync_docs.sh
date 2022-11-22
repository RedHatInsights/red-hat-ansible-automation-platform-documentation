#!/bin/bash

######
# This script synchronizes content to the downstream repository.
# There is a Jenkins job that configures the source and target repositories and runs this script directly.
# If you commit changes to this script you should verify the Jenkins job runs successfully.
######

# Set the path to the source and target directories.
# The source directory contains the content that you want to synchronize.
source=source
# The target directory is the location where you want to synchronize content.
target=target

# Clean the existing downstream and release-note folders.
rm -rf $target/downstream
rm -rf $target/release-notes

# Copy the content of the downstream and release-note folders.
cp -r $source/downstream $target/downstream
cp -r $source/release-notes $target/release-notes
