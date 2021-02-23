import 'dart:convert';
import 'package:http/http.dart' as http;
import 'constants.dart';

class AppIdLogic {
  String parseAuthCode(String idToken) {
    // Get code from URI
    // com.bobiapp.auth://login-callback?code=xxx&state=yyyy
    RegExp exp = new RegExp(r"(\?|\&)([^=]+)\=([^\&]+)");

    var code;
    try {
      // ?code=xxx
      code = exp.firstMatch(idToken).group(3);
    } catch (e) {
      throw new Exception("Authorization Code was not parsed correctly");
    }

    return code;
  }

  Future<Map<String, dynamic>> getAccessTokenFromAuthCode(String token) async {
    // Get Token from Auth Code
    // {{APPID_AUTH_SERVER_HOST}}/oauth/v4/{{APPID_TENANT_ID}}/authorization?client_id={{APPID_CLIENT_ID}}&redirect_uri={{REDIRECT_URI}}&scope=openid&response_type=code
    var headers = {
      'Authorization':
          'Basic NWMxNmI5ODEtYTUwOC00NWI4LWExMWYtM2IzNGJkOGEzYzQyOk16VmlPVFJqTnpNdE9HVmhOUzAwTVRKakxUazFZamd0WWpNd056ZzJORFZrTnpVNA==',
      // 'Cookie': '__cfduid=d2590d812445cc75498fa7dc96725e0281613134732' HOW TO GET THIS!
    };
    var request = http.MultipartRequest('POST', Uri.parse(kAUTH_TOKEN));
    request.fields.addAll({
      'grant_type': 'authorization_code',
      'code': token,
      'redirect_uri': kAUTH_REDIRECT_URI
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var res;
    if (response.statusCode == 200) {
      var rawres = await response.stream.bytesToString();
      res = jsonDecode(rawres);
    } else {
      print(response.reasonPhrase);
    }

    return res;
  }

  Future<Map<String, dynamic>> refreshToken(String refreshToken) async {
    var headers = {
      'Authorization':
          'Basic NWMxNmI5ODEtYTUwOC00NWI4LWExMWYtM2IzNGJkOGEzYzQyOk16VmlPVFJqTnpNdE9HVmhOUzAwTVRKakxUazFZamd0WWpNd056ZzJORFZrTnpVNA==',
    };
    var request = http.MultipartRequest('POST', Uri.parse(kAUTH_TOKEN));
    request.fields.addAll({
      'grant_type': 'refresh_token',
      'refresh_token': refreshToken,
      'redirect_uri': kAUTH_REDIRECT_URI
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var res;
    if (response.statusCode == 200) {
      var rawres = await response.stream.bytesToString();
      res = jsonDecode(rawres);
    } else {
      print(response.reasonPhrase);
    }

    return res;
  }

  Future<String> getUserDetails(String accessToken) async {
    var headers = {
      'Authorization': 'Bearer $accessToken',
      // 'Cookie': '__cfduid=d2590d812445cc75498fa7dc96725e0281613134732' how to get this?
    };
    var request = http.Request('GET', Uri.parse(kAUTH_USERINFO));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var res;
    if (response.statusCode == 200) {
      // res = jsonDecode(await response.stream.bytesToString());
      res = await response.stream.bytesToString();
    } else {
      print(response.reasonPhrase);
    }

    return res;
  }
}
