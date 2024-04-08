import 'package:flutter_internship_2024_app/data/platforms/data_provider/platforms_data_provider.dart';

import '../../../models/platform.dart';

class PlatformsRepository{
  final PlatformsDataProvider _dataProvider;

  PlatformsRepository(this._dataProvider);

  Future<String> getPlatforms() async {
    return await _dataProvider.getPlatforms();
  }
}