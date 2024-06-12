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


new_content_file="pom.xml"  # File with new content

# Read the new content from the file and base64 encode it
new_content=$(cat "$new_content_file")
encoded_content=$(echo -n "$new_content" | base64)

# Get the SHA of the existing file
response=$(curl -s -H "Authorization: token token" https://api.github.com/repos/kopi-sg/app-simulator/contents/pom.xml

sha=$(echo $response | jq -r '.sha')

# Create the JSON payload file
cat << EOF > update_payload.json
{
  "message": "Update the file with new content",
  "content": "$encoded_content",
  "sha": "$sha",
  "branch": "$branch"
}
EOF



curl -X PUT -H "Authorization: token token" -H "Content-Type: application/octet-stream" https://api.github.com/repos/kopi-sg/app-simulator/contents/pom.xml -d @pom.xml -d '{"message":"Your commit message"}'




curl -X PUT -H "Authorization: token ${{github.token}}"  -H "Content-Type: application/json" "https://api.github.com/repos/kopi-sg/app-simulator/contents/pom.xml" -d 
'{"message":"bt github-bump [ci skip]","sha":"abc","committer":{"name":"test111","email":"test111},"content":"'"$file_content"'"}' -v --trace-ascii -
