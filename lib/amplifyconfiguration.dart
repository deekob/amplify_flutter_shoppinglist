const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "FlutterShoppingList": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://2btc67x7ufcgdi4jlufkukhgry.appsync-api.ap-southeast-2.amazonaws.com/graphql",
                    "region": "ap-southeast-2",
                    "authorizationType": "API_KEY",
                    "apiKey": "da2-spkuiyfvkze2hlglg2edl4ekse"
                }
            }
        }
    },
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "AppSync": {
                    "Default": {
                        "ApiUrl": "https://2btc67x7ufcgdi4jlufkukhgry.appsync-api.ap-southeast-2.amazonaws.com/graphql",
                        "Region": "ap-southeast-2",
                        "AuthMode": "API_KEY",
                        "ApiKey": "da2-spkuiyfvkze2hlglg2edl4ekse",
                        "ClientDatabasePrefix": "FlutterShoppingList_API_KEY"
                    },
                    "FlutterShoppingList_AWS_IAM": {
                        "ApiUrl": "https://2btc67x7ufcgdi4jlufkukhgry.appsync-api.ap-southeast-2.amazonaws.com/graphql",
                        "Region": "ap-southeast-2",
                        "AuthMode": "AWS_IAM",
                        "ClientDatabasePrefix": "FlutterShoppingList_AWS_IAM"
                    }
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "ap-southeast-2:26576304-d8aa-4f27-9297-a80315fa1a53",
                            "Region": "ap-southeast-2"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "ap-southeast-2_4luxRWNkD",
                        "AppClientId": "7k1m1tmgj1nqshfdeg7jrpt0g0",
                        "Region": "ap-southeast-2"
                    }
                },
                "Auth": {
                    "Default": {
                        "authenticationFlowType": "USER_SRP_AUTH"
                    }
                }
            }
        }
    }
}''';