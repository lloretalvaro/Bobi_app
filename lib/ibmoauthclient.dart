import 'package:oauth2_client/oauth2_client.dart';
import 'package:meta/meta.dart';

class IBMOAuth2Client extends OAuth2Client {
  IBMOAuth2Client(
      {@required String redirectUri, @required String customUriScheme})
      : super(
            authorizeUrl:
                'https://eu-de.appid.cloud.ibm.com/oauth/v4/692743c7-d888-4087-8f01-7144f69d059e/authorization', //Your service's authorization url
            tokenUrl:
                'https://eu-de.appid.cloud.ibm.com/oauth/v4/692743c7-d888-4087-8f01-7144f69d059e/token', //Your service access token url
            redirectUri: redirectUri,
            customUriScheme: customUriScheme);
}
