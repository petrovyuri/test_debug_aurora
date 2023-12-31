// SPDX-FileCopyrightText: Copyright 2023 Open Mobile Platform LLC <community@omp.ru>
// SPDX-License-Identifier: BSD-3-Clause
import 'package:flutter_example_packages/base/package/package_page.dart';
import 'package:flutter_example_packages/packages/flutter_secure_storage/page.dart';
import 'package:get_it/get_it.dart';

import 'model.dart';

/// Package values
final packageFlutterSecureStorage = PackagePage(
  key: 'flutter_secure_storage',
  descEN: '''
    Flutter Secure Storage provides API to store data in secure storage.
    ''',
  descRU: '''
    Flutter Secure Storage предоставляет API для хранения данных в безопасном хранилище.
    ''',
  version: '9.0.0',
  isPlatformDependent: true,
  page: () => FlutterSecureStoragePage(),
  init: () {
    GetIt.instance.registerFactory<FlutterSecureStorageModel>(
        () => FlutterSecureStorageModel());
  },
);
