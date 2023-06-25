# Load aws boto3 module
import boto3
import json

# Create S3 resource
s3 = boto3.client('s3', region_name='eu-central-1')

# Set a bucket name
bucket_name = "<PUT_YOUR_BUCKET_NAME_HERE>"

# Create a new S3 bucket, using a demo bucket name
s3.create_bucket(Bucket=bucket_name, CreateBucketConfiguration={
    'LocationConstraint': 'eu-central-1'})

response_public = s3.put_public_access_block(
        Bucket=bucket_name,
        PublicAccessBlockConfiguration={
            'BlockPublicAcls': False,
            'IgnorePublicAcls': False,
            'BlockPublicPolicy': False,
            'RestrictPublicBuckets': False
        },
    )

bucket_policy = {
    'Version': '2012-10-17',
    'Statement': [{
        'Sid': 'AddPerm',
        'Effect': 'Allow',
        'Principal': '*',
        'Action': ['s3:GetObject'],
        'Resource': f'arn:aws:s3:::{bucket_name}/*'
    }]
}

# Convert the policy from JSON dict to string
bucket_policy = json.dumps(bucket_policy)
s3.put_bucket_policy(Bucket=bucket_name, Policy=bucket_policy)


s3.put_bucket_website(
     Bucket=bucket_name,
     WebsiteConfiguration={
     'IndexDocument': {'Suffix': 'index.html'},
    }
 )

s3.put_object(Bucket=bucket_name, Key='index.html', Body='<h1>My website</h1>', ContentType='text/html')
