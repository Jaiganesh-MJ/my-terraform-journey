import boto3
import os
region = 'eu-west-1'
instances = ['i-0c11cc639dd627491']
ec2 = boto3.client('ec2', region_name=region)

def lambda_handler(event, context):
    ec2.stop_instances(InstanceIds=instances)
    print('stopped your instances: ' + str(instances))