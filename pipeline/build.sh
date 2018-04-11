#!/bin/bash
pip install --upgrade awscli
aws --version
pip install virtualenv
virtualenv /tmp/venv
. /tmp/venv/bin/activate
pip install -r requirements-dev.txt
pip install chalice==1.2.0

chalice package /tmp/packaged
aws cloudformation package --template-file /tmp/packaged/sam.json --s3-bucket "${APP_S3_BUCKET}" --output-template-file /tmp/packaged/transformed.yaml