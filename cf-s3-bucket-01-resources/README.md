# CloudFormation

## Create resources using AWS console

1. login to https://console.aws.amazon.com/
1. Open CloudFormation service
1. Click `Create stack` -> `With new resources (standard)`
1. `Template source` -> `Upload a template file`
1. Choose `cf-s3-bucket-1/s3-website.yaml` file
1. Click `Next`
1. Type `Stack Name`, e.g.: `s3-bucket-1`
1. Click `Next` 2x
1. Click `Submit`

## Upload file to be hosted
1. Open S3 service and navigate to created bucket.
1. Upload file to be hosted.

## Test hosted site
1. To test sucessfull reposne, open in browser:
http://<PUT_YOUR_BUCKET_NAME_HERE>.s3-website.eu-central-1.amazonaws.com


## Delete resources using AWS console
1. Open S3 service and navigate to created bucket.
1. Click `Empty` button
1. Open CloudFormation service
1. Choose previously created stack
1. Click `Delete` button and confirm