import json
from math_ops import *
from str_fun import *

def lambda_handler(event, context):
    
    
    print("Event Data -> ", event)
    print("Trigger Received !!!")

    print("Square of a number = ", square(5))
    print("Sum of two numbers = ", sum(5,4))
    print("Double the string = ", double_string("Shashank"))
    
    # TODO implement
    return {
        'statusCode': 200,
        'body': json.dumps('Bye Bye !!')
    }
