import json

def lambda_handler(event, context):
    # TODO implement
    
    print("Received Trigger Event : ", event)
    return {
        'statusCode': 200,
        'body': json.dumps({'event_type' : 'S3 Trigger Event', 'Purpose' : 'Testing'})
    }

