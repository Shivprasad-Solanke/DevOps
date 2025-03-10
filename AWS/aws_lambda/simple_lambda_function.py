import boto3
import pandas as pd
import io
import os

s3_client = boto3.client('s3')

def lambda_handler(event, context):
    # Retrieve bucket and key from the event data
    bucket = event['Records'][0]['s3']['bucket']['name']
    key = event['Records'][0]['s3']['object']['key']
    
    # Get the file from S3
    response = s3_client.get_object(Bucket=bucket, Key=key)
    file_content = response['Body'].read().decode('utf-8')
    
    print("File content:", file_content)
    
    # Check if the file is empty
    if not file_content.strip():
        error_message = "The file is empty."
        print(error_message)
        return {
            'statusCode': 400,
            'body': error_message
        }
    
    # Use header=None since the file is just a single value without a header row
    file_like = io.StringIO(file_content)
    try:
        df = pd.read_csv(file_like, header=None)
    except Exception as e:
        error_message = f"Error reading CSV: {e}"
        print(error_message)
        return {
            'statusCode': 400,
            'body': error_message
        }
    
    print("DataFrame content:", df)
    
    # Check if DataFrame is empty
    if df.empty:
        error_message = "DataFrame is empty. Please ensure the CSV file contains data."
        print(error_message)
        return {
            'statusCode': 400,
            'body': error_message
        }
    
    # Extract the name from the first cell of the DataFrame
    name = df.iloc[0, 0]
    
    # Construct and log the greeting message
    message = f"hello {name}"
    print(message)
    
    return {
        'statusCode': 200,
        'body': message
    }