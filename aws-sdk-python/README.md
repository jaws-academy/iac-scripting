# iac-scripting

Replace:
```
<PUT_YOUR_BUCKET_NAME_HERE>
```
with the unique name of the bucket to host the website.

Run:
```
pip install boto3
```

To provision S3 based hosted static website run:

```
python3 main.py
```

To cleanup run:

```
python3 cleanup.py
```