#!/bin/bash

set -e

# empty bucket
aws s3 rm s3://<UNIQUE_BUCKET_NAME> --recursive

# delete bucket
aws s3 rb s3://<UNIQUE_BUCKET_NAME>
