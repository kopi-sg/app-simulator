#!/bin/bash
### version 1
# Extract the current version from the pom.xml
current_version=$(mvn help:evaluate -Dexpression=project.version -q -DforceStdout)
echo "Current version: $current_version"

# Break the version number into its components
IFS='.' read -r -a version_parts <<< "$current_version"

# Increment the patch version
((version_parts[2]++))

# Construct the new version
new_version="${version_parts[0]}.${version_parts[1]}.${version_parts[2]}"

# Update the pom.xml with the new version
# mvn versions:set -DnewVersion=$new_version

echo "Version updated to $new_version"

### version 2
# # Extract the current version from the pom.xml
# current_version=$(mvn help:evaluate -Dexpression=project.version -q -DforceStdout)

# # Remove the -SNAPSHOT suffix if present
# base_version=${current_version%-SNAPSHOT}

# # Break the version number into its components
# IFS='.' read -r -a version_parts <<< "$base_version"

# # Increment the patch version
# ((version_parts[2]++))

# # Construct the new version with the -SNAPSHOT suffix if it was originally present
# new_version="${version_parts[0]}.${version_parts[1]}.${version_parts[2]}"
# new_version+=$( [[ $current_version == *"-SNAPSHOT" ]] && echo "-SNAPSHOT" || echo "" )

# # Update the pom.xml with the new version
# # mvn versions:set -DnewVersion=$new_version

# echo "Version updated to $new_version"