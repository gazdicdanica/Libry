import 'dart:convert';

import 'package:flutter_internship_2024_app/data/libraries/data_provider/libraries_provider.dart';
import 'package:flutter_internship_2024_app/models/library.dart';

class LibrariesRepository{
  final LibrariesProvider librariesProvider;
  LibrariesRepository(this.librariesProvider);

  Future<List<Library>> getCurrentLibraires(String platfrom) async{
    try{
        String packageName=platfrom;

        final packageData= await librariesProvider.getCurrentLibraires(packageName);

        final data =jsonDecode(packageData);
        final List<Library> libraries=List<Library>.from(data.map((libraryData)
        =>Library.fromMap(libraryData)).toList());     
       return libraries;
     
   }
    catch (e){
      throw e.toString();
    }
  }
  
}