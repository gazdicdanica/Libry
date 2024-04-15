import 'dart:convert';

import 'package:flutter_internship_2024_app/data/libraries/data_provider/libraries_provider.dart';
import 'package:flutter_internship_2024_app/data/platforms/repository/platforms_repository.dart';
import 'package:flutter_internship_2024_app/models/library.dart';

class LibrariesRepository {
  final LibrariesProvider librariesProvider;
  final PlatformsRepository platformsRepository;

  LibrariesRepository(
    this.librariesProvider,
    this.platformsRepository,
  );

  Future<List<Library>> getCurrentLibraires(
      String platfrom, String sort) async {
    try {
      String packageName = platfrom;

      final packageData =
          await librariesProvider.getCurrentLibraires(packageName, sort);

      final data = jsonDecode(packageData);
      final List<Library> libraries = List<Library>.from(
          data.map((libraryData) => Library.fromMap(libraryData)).toList());

      final platforms = await platformsRepository.getPlatforms();

      for (var library in libraries) {
        final platformData = platforms
            .firstWhere((platform) => platform.name == library.platform);
        library.platformColor = platformData.color;
      }

      return libraries;
    } catch (e) {
      throw e.toString();
    }
  }
}
