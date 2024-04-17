import 'dart:async';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:http/http.dart' as http;

class PlatformsDataProvider {
  Future<String> getPlatforms() async {
    final apiKey = dotenv.env['API_KEY'];
    try {
      final res = await http
          .get(Uri.parse('https://libraries.io/api/platforms?api_key=$apiKey'))
          .timeout(const Duration(seconds: 20),
              onTimeout: () => throw TimeoutException(t.internet_error));
      if (res.statusCode != 200) {
        throw(t.platforms_error);
      }
      return res.body;
    } catch (e) {
      if (e is SocketException) {
        throw(t.internet_error);
      } else {
        throw (e.toString());
      }
    }
  }
}
