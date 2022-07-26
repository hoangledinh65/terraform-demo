import json
import boto3


ssm = boto3.client('ssm', region_name='ap-southeast-1')

def lambda_handler(event, context):
    # TODO implement
    username = ssm.get_parameters(Names=["hoangdl-username-prod"])
    print(username)
    password = ssm.get_parameters(Names=["hoangdl-password-prod"], WithDecryption=True)
    print(password)
    return "worked!"
