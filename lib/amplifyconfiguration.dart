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
            "PoolId": "us-east-2_hUzRnEJE6",
            "AppClientId": "crnp263rpvddhupc39oobqkv5",
            "Region": "us-east-2"
          }
        }
      }
    }
  }
}''';
