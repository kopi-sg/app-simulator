#!/bin/bash

# Get the current version from the pom.xml
current_version=$(mvn help:evaluate -Dexpression=project.version -q -DforceStdout)
echo "Current version: $current_version"

# Parse the current version and increment the patch number
IFS='.' read -r -a version_parts <<< "$current_version"
major=${version_parts[0]}
minor=${version_parts[1]}
patch=${version_parts[2]}
new_patch=$((patch + 1))
new_version="$major.$minor.$new_patch"

echo "New version: $new_version"

# Set the new version
mvn org.codehaus.mojo:versions-maven-plugin:2.16.2:set -DnewVersion=$new_version