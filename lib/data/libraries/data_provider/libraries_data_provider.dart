import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';

class LibrariesDataProvider {
  Future<String> getCurrentLibraires(String packageName, String sort) async {
    final apiKey = dotenv.env['API_KEY'];
    try {
      final res = await http
          .get(
            Uri.parse(
              'https://libraries.io/api/search?q=$packageName&api_key=$apiKey&sort=$sort',
            ),
          )
          .timeout(const Duration(seconds: 60),
              onTimeout: () => throw t.internet_error);
      if (res.statusCode != 200) {
        throw (t.libraries_error);
      }
      return res.body;
    } catch (e) {
      if (e is SocketException) {
        throw (t.internet_error);
      } else {
        throw (e.toString());
      }
    }
  }
}
