#!/bin/bash

set -e

bucket_name=<PUT_YOUR_BUCKET_NAME_HERE>

# empty bucket
aws s3 rm "s3://${bucket_name}" --recursive

# delete bucket
aws s3 rb "s3://${bucket_name}"
