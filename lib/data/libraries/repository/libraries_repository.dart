import 'dart:convert';

import 'package:flutter_internship_2024_app/data/libraries/data_provider/libraries_data_provider.dart';
import 'package:flutter_internship_2024_app/data/platforms/repository/platforms_repository.dart';
import 'package:flutter_internship_2024_app/models/library.dart';

class LibrariesRepository {
  final LibrariesDataProvider librariesProvider;
  final PlatformsRepository platformsRepository;

  LibrariesRepository(
    this.librariesProvider,
    this.platformsRepository,
  );

  Future<List<Library>> getCurrentLibraires(
      String platfrom, String sort, int page) async {
    try {
      String packageName = platfrom;

      final packageData =
          await librariesProvider.getCurrentLibraires(packageName, sort, page);

      final data = jsonDecode(packageData);
      final List<Library> libraries = List<Library>.from(
          data.map((libraryData) => Library.fromMap(libraryData)).toList());

      if (platformsRepository.platforms.isEmpty) {
        await platformsRepository.fetchPlatforms();
      }

      final platforms = platformsRepository.platforms;

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
