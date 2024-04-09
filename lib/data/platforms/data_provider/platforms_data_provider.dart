import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class PlatformsDataProvider{

  Future<String> getPlatforms() async {
    final apiKey = dotenv.env['API_KEY'];
    try{
      final res = await http.get(Uri.parse('https://libraries.io/api/platforms?api_key=$apiKey'));

      return res.body;  
    }catch(e){
      throw e.toString();
    }


  }
}