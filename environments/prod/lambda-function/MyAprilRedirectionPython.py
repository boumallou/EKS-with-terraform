import json


def lambda_handler(event, context):
    response = dict()
    response["statusCode"] = 302
    response["statusDescription"]: 'Found',
    response["headers"] = {
        "location": [
            {
                "key": "Location",
                "value": "https://maintenance.uws-tech.com"
            }
        ]
    }

    return response