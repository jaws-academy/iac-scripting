#!/bin/bash

set -e

bucket_name=<PUT_YOUR_BUCKET_NAME_HERE>
aws_region=eu-central-1

# Create a bucket + Enable static website hosting
aws s3api create-bucket --bucket "${bucket_name}" --create-bucket-configuration LocationConstraint=${aws_region} --no-cli-pager
#aws s3api put-public-access-block --bucket "${bucket_name}" --public-access-block-configuration "BlockPublicPolicy=false" --region ${aws-region} --no-cli-pager

aws s3api put-public-access-block \
    --bucket "${bucket_name}" \
    --public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false"


# Add a bucket policy that makes your bucket content publicly available
aws s3api put-bucket-policy --no-cli-pager --bucket "${bucket_name}" --policy '{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::'"${bucket_name}"'/*"
 
            ]
        }
    ]
}'

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
aws s3 cp index.html s3://${bucket_name} --no-cli-pager

aws s3 website "s3://${bucket_name}" --index-document index.html

# Test your website endpoint
curl "http://${bucket_name}.s3-website.eu-central-1.amazonaws.com/"