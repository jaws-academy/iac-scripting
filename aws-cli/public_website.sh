#!/bin/bash

set -e

UNIQUE_BUCKET_NAME=<UNIQUE_BUCKET_NAME>

# Create a bucket + Enable static website hosting
aws s3api create-bucket --bucket ${UNIQUE_BUCKET_NAME} --acl public-read
aws s3 website s3://${UNIQUE_BUCKET_NAME} --index-document index.html

# Add a bucket policy that makes your bucket content publicly available
aws s3api put-bucket-policy --bucket ${UNIQUE_BUCKET_NAME} --policy file://policy_s3.json

# dump an index document
cat << EOF > index.html
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>My Website Home Page</title>
</head>
<body>
  <h1>Welcome to my website</h1>
  <p>Now hosted on Amazon S3!</p>
</body>
</html>
EOF

# upload index
aws s3 cp index.html s3://${UNIQUE_BUCKET_NAME}



# Test your website endpoint
curl http://${UNIQUE_BUCKET_NAME}.s3-website.us-east-1.amazonaws.com