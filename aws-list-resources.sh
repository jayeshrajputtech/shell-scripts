#!/bin/bash

##########################
#Author: Jayesh Rajput
# Date: 05/12/2024
# # Description: Lists the AWS EC2, S3, Lambda and IAM User resources
# # Version: v1
# ###########################

# Debug Exit Pipe fail
set -e
#set -x
set -o pipefail

#AWS EC2
echo "******************************************Listing Amazon EC2 instances******************************************"
#aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'
aws ec2 describe-instances --query 'Reservations[].Instances[].InstanceId'
          
#AWS S3  
echo "******************************************Listing Amazon S3 buckets******************************************"
aws s3 ls | awk  '{print $3}'
             
#AWS Lambda
echo "******************************************Listing Amazon Lambda Functions******************************************"
#aws lambda list-functions | jq '.Functions[].FunctionName'
aws lambda list-functions --query 'Functions[].FunctionName'

#AWS IAM
echo "******************************************Listing AWS IAM Users******************************************"
aws iam list-users --query 'Users[].UserName[]'
    
