# test="$(cat pom.xml | base64)"
test=$(base64 < "pom.xml" | tr -d '\n')
echo "$test"

# PAYLOAD="{ \"message\": \"my commit message\", \"content\": \"$test\" }"

# # Get SHA-256 hash of the file
# # FILE_HASH=$(sha256sum "pom.xml" | cut -d ' ' -f1)
# shasum -a 1 pom.xml
# curl https://api.github.com/repos/kopi-sg/app-simulator/contents/pom.xml

# echo "File SHA-256: $FILE_HASH"  # Optional, print the hash for reference

# # ... (rest of the script)

# # Include the SHA in the commit message (optional)
# COMMIT_MESSAGE="$COMMIT_MESSAGE. SHA-256: $FILE_HASH"
# echo $FILE_HASH

curl -X PUT -H "Authorization: token token" -H "Content-Type: application/json" "https://api.github.com/repos/kopi-sg/app-simulator/contents/pom.xml" -d '{"message":"my commit message","sha":"b9cee44b4ebe69a7f73e126f857219fa31b55adf","committer":{"name":"test","email":"test"},"content":"'"$test"'"}' -v --trace-ascii -




#   curl -X PUT -H "Authorization: token ${{github.token}}" -H "Content-Type: application/json" "https://api.github.com/repos/kopi-sg/app-simulator/contents/pom.xml" -d '{"message":"bt github-bump [ci skip]","sha":"$sha_value","committer":{"name":"${{github.actor}}","email":"${{ github.actor_id }}+${{ github.actor }}@users.noreply.github.com"},"content":"'"$file_content"'"}'

# test="123"
# curl -X PUT -H "Authorization: token token" -H "Content-Type: application/json" "https://api.github.com/repos/kopi-sg/app-simulator/contents/pom.xml" -d '{"message":"my commit message","sha":"abc123","committer":{"name":"test","email":"test"},"content":"'"$test"'"}'
