// Defines the Object which facilitates Network Services in the app

import 'package:http/http.dart' as http;

class NetworkServices {
  static var client = http.Client();

  Future<String> fetchData(String url) async {
    try {
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return Future.error('server error');
      }
    } catch (error) {
      return Future.error(error.toString());
    }
  }
}

