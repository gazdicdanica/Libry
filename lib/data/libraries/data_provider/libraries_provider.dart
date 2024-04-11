import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';

class LibrariesProvider {
  Future<String> getCurrentLibraires(String packageName) async {
    final apiKey = dotenv.env['API_KEY'];
    try {
      final res = await http.get(
        Uri.parse(
          'https://libraries.io/api/search?q=$packageName&api_key=$apiKey',
        ),
      );
      if (res.statusCode != 200) {
        throw ('Failed to load libraries.');
      }
      return res.body;
    } catch (e) {
      if (e is SocketException) {
        throw ('No Internet Connection.');
      } else if (e is TimeoutException) {
        throw ('Request timed out.');
      } else {
        throw (e.toString());
      }
    }
  }
}
