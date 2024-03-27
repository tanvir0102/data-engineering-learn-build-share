import json

def lambda_handler(event, context):
    # TODO implement
    print("Event : ", event)
    print("Context : ", context)
    a = event['a']
    b = event['b']
    total_sum = a + b
    print("Sum of a & b is = ",total_sum)
    return {
        'statusCode': 200,
        'body': json.dumps({'total_sum' : total_sum})
    }

# Use this payload for testing lambda from console

# {
#   "a": 20,
#   "b": 30
# }
