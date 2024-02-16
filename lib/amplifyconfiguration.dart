const amplifyconfig = ''' {
  "UserAgent": "aws-amplify-cli/2.0",
  "Version": "1.0",
  "auth": {
    "plugins": {
      "awsCognitoAuthPlugin": {
        "IdentityManager": {
          "Default": {}
        },
        "CognitoUserPool": {
          "Default": {
            "PoolId": "us-east-1_TpvvEG6Eo",
            "AppClientId": "69g0c8fva2p1supunh3fh0li0a",
            "Region": "us-east-1"
          }
        }
      }
    }
  }
}''';
