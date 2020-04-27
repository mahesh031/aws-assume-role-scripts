# aws-assume-role-scripts
Useful scripts for getting assume role/ temp credentials for aws accounts.

The repository contains two script files. Any of these scripts can be used to get the credentials from 
the AWS account based on the feasibility.

Pre-requisites
-----------------
"jq" needs to be installed


with-env-variables.sh 
---------------------
Easy to use script where one has to just provide the aws access key, secret key and aws role Arn.</br> Based on the inputs, temporary session token will be created.</br> Session token along with access and secret keys can be used to fetch the resources from AWS. 


with-profile-option.sh
----------------------
Script creates the aws credentials and config file under temporary location. Script populates the credentials and necessary porfile details as well. 

Following AWS environment variables wil be used to override the default location of ".aws/credentials" and  "'.aws/config" files respectively.

AWS_SHARED_CREDENTIALS_FILE<br />
AWS_CONFIG_FILE<br />


USAGE:
---------------------
Replace the following place holders with valid values:<br />
${awsAccessKeyId} - AWS access key <br />
${awsSecretAccessKey} - AWS secret ke y<br />
${awsRegion} - AWS account region <br />
${awsRoleArn} - AWS assume role ARN <br />



