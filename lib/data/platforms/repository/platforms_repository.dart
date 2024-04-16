import 'dart:convert';

import 'package:flutter_internship_2024_app/data/platforms/data_provider/platforms_data_provider.dart';

import '../../../models/platform.dart';

class PlatformsRepository{
  final PlatformsDataProvider _dataProvider;
  List<Platform> _platforms = [];

  PlatformsRepository(this._dataProvider);

  List<Platform> get platforms => _platforms;

  Future<List<Platform>> fetchPlatforms() async {
    final body = jsonDecode(await _dataProvider.getPlatforms());
    _platforms = body.map<Platform>((json) => Platform.fromJson(json)).toList();
    return _platforms;
  }

}