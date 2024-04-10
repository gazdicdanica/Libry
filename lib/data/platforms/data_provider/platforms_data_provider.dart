import 'dart:async';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class PlatformsDataProvider {
  Future<String> getPlatforms() async {
    final apiKey = dotenv.env['API_KEY'];
    try {
      final res = await http
          .get(Uri.parse('https://libraries.io/api/platforms?api_key=$apiKey'));
      if (res.statusCode != 200) {
        throw('Failed to load platforms.');
      }
      return res.body;
    } catch (e) {
      if (e is SocketException) {
        throw('No Internet Connection.');
      } else if (e is TimeoutException) {
        throw('Request timed out.');
      } else {
        throw(e.toString());
      }
    }
  }
}
