import 'dart:async';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class LibrariesProvider{
  Future<String>  getCurrentLibraires(String packageName)async{
     final apiKey = dotenv.env['API_KEY'];
    try{
      final res= await http.get(Uri.parse(
       'https://libraries.io/api/search?q=$packageName&api_key=$apiKey&sort=rank',),
       );

       if(res.statusCode !=200)
       {
        throw('Failed to load Libraries');
       }
    return res.body;
    }
    catch(e){
      if(e is SocketException){
        throw("No interner Connetion!");
      } else if (e is TimeoutException){
        throw('Request timed out');
      } else
      {
           throw e.toString();
      }
     
    }
  }
}