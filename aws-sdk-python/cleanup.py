import boto3

# Set a bucket name
bucket_name = "<PUT_YOUR_BUCKET_NAME_HERE>"

s3 = boto3.resource('s3')
bucket = s3.Bucket(bucket_name)
# suggested by Jordon Philips 
bucket.objects.all().delete()

bucket.delete()