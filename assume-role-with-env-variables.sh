#!/bin/sh

set -e

export AWS_ACCESS_KEY_ID=${awsAccessKeyId}
export AWS_SECRET_ACCESS_KEY=${awsSecretAccessKey}
export AWS_DEFAULT_REGION=${awsRegion}
export AWS_ROLE_ARN=${awsRoleArn}

aws sts assume-role --role-arn "${AWS_ROLE_ARN}"  --role-session-name role-session >>/dev/null 2>&1

unset  AWS_SESSION_TOKEN
temp_role=$(aws sts assume-role \
                    --role-arn "${AWS_ROLE_ARN}" \
                    --role-session-name "role-session")

export AWS_ACCESS_KEY_ID=$(echo $temp_role | jq .Credentials.AccessKeyId | xargs) >>/dev/null 2>&1
export AWS_SECRET_ACCESS_KEY=$(echo $temp_role | jq .Credentials.SecretAccessKey | xargs) >>/dev/null 2>&1
export AWS_SESSION_TOKEN=$(echo $temp_role | jq .Credentials.SessionToken | xargs) >>/dev/null 2>&1


aws s3 ls
