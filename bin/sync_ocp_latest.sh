#!/bin/bash

# Set the path to the file that contains the ":OCPLatest:" attribute.
attributes=../downstream/attributes/attributes.adoc

# Retrieve the OCP attributes file from the OpenShift docs repository.
curl https://raw.githubusercontent.com/openshift/openshift-docs/main/_attributes/ocp-attributes.adoc -o ocp-attributes.adoc
# Save the value of the "product-version" attribute as a variable.
ocpversion=$(sed -n -e 's/^:product-version: //p' ocp-attributes.adoc)
# Replace the value of the "OCPLatest" attribute with the value of the "product-version" attribute.
sed -i -e "s/^:OCPLatest:.*/:OCPLatest: $ocpversion/" $attributes
# Delete the OCP attributes file.
rm -f ocp-attributes.adoc
