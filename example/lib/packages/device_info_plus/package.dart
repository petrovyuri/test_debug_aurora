// SPDX-FileCopyrightText: Copyright 2023 Open Mobile Platform LLC <community@omp.ru>
// SPDX-License-Identifier: BSD-3-Clause
import 'package:flutter_example_packages/base/package/package_page.dart';
import 'package:flutter_example_packages/packages/device_info_plus/page.dart';
import 'package:get_it/get_it.dart';

import 'model.dart';

/// Package values
final packageDeviceInfoPlus = PackagePage(
  key: 'device_info_plus',
  descEN: '''
    Get current device information from within the Flutter application.
    ''',
  descRU: '''
    Получите текущую информацию об устройстве из приложения Flutter.
    ''',
  version: '9.0.3',
  isPlatformDependent: true,
  page: () => DeviceInfoPlusPage(),
  init: () {
    GetIt.instance
        .registerFactory<DeviceInfoPlusModel>(() => DeviceInfoPlusModel());
  },
);
