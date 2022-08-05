#!/bin/bash

######
# This script synchronizes cloud content to the downstream repository.
# There is a Jenkins job that configures the source and target repositories and runs this script directly.
# If you commit changes to this script you should verify the Jenkins job runs successfully.
######

# Set the path to the source and target directories.
# The source directory contains the content that you want to synchronize.
source=source
# The target directory is the location where you want to synchronize content.
target=target

# Clean the target directories.
rm -rf $target/aap-on-aws
rm -rf $target/aap-on-azure
rm -rf $target/attributes
rm -rf $target/images

# Add downstream cloud directories.
mkdir $target/aap-on-aws
mkdir $target/aap-on-azure

# Copy assemblies to the target directories.
cp -r $source/downstream/assemblies/aap-on-aws/*.adoc $target/aap-on-aws/
cp -r $source/downstream/assemblies/aap-on-azure/*.adoc $target/aap-on-azure/

# Modify the include directive in assemblies for a flat directory structure.

sed -i -e 's/include::aap-on-aws\//include::/g' -e 's/include::aap-on-azure\//include::/g' $target/*/*.adoc

# Copy the modules to the target directories.
cp -r $source/downstream/modules/aap-on-aws/*.adoc $target/aap-on-aws/
cp -r $source/downstream/modules/aap-on-azure/*.adoc $target/aap-on-azure/

# Copy the attributes and images to the target directories.
cp -r $source/downstream/attributes/ $target/attributes/
cp -r $source/downstream/images/ $target/images/
