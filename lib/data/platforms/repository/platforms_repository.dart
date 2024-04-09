import 'dart:convert';

import 'package:flutter_internship_2024_app/data/platforms/data_provider/platforms_data_provider.dart';

import '../../../models/platform.dart';

class PlatformsRepository{
  final PlatformsDataProvider _dataProvider;

  PlatformsRepository(this._dataProvider);

  Future<List<Platform>> getPlatforms() async {
    final body = jsonDecode(await _dataProvider.getPlatforms());
    final List<Platform> platforms = body.map<Platform>((json) => Platform.fromJson(json)).toList();
    return platforms;
  }
}