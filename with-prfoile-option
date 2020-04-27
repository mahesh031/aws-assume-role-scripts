#!/bin/sh
set -e

#Create aws credentials file under temp directory
AWS_CREDENTIALS_FILE=/tmp/.aws/credentials
mkdir -p “${AWS_CREDENTIALS_FILE%/*}”
touch $AWS_CREDENTIALS_FILE
chmod 600 $AWS_CREDENTIALS_FILE
echo “[user]”                              > $AWS_CREDENTIALS_FILE
echo “aws_access_key_id = xxxxxxxxx”         >> $AWS_CREDENTIALS_FILE
echo “aws_secret_access_key = xxxxxxxx” >> $AWS_CREDENTIALS_FILE
echo “region = xxxxxx” >> $AWS_CREDENTIALS_FILE

#Create aws config file under temp directory
AWS_CONFIG_FILE=/tmp/.aws/config
mkdir -p “${AWS_CONFIG_FILE%/*}”
touch $AWS_CONFIG_FILE
chmod 600 $AWS_CONFIG_FILE
echo “[profile env-profile]”      > $AWS_CONFIG_FILE
echo “role_arn = xxxxxxx”         >> $AWS_CONFIG_FILE
echo “source_profile = user” >> $AWS_CONFIG_FILE
echo “region = xxxxxxx" >> $AWS_CONFIG_FILE

#use environment variable to override default file location
export AWS_CONFIG_FILE=$AWS_CONFIG_FILE
export AWS_SHARED_CREDENTIALS_FILE=$AWS_CREDENTIALS_FILE

aws s3 ls --profile env-profile

unset AWS_CONFIG_FILE
unset AWS_SHARED_CREDENTIALS_FILE
rm -rf /tmp/.aws/*
