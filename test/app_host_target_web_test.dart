// Copyright (c) 2016, Alexandre Roux Tekartik. All rights reserved. Use of this source code

// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:tekartik_app_utils/app_host_target_web.dart';
import 'package:tekartik_common_utils/env_utils.dart';
import 'package:test/test.dart';

void main() {
  group('app_host_target_web', () {
    LocationInfo? locationInfoOrNull;
    if (kDartIsWeb) {
      locationInfoOrNull = locationInfoWeb;
    }
    if (locationInfoOrNull == null) {
      test('no locationInfoWeb', () {
        print('no locationInfoWeb available');
      });
    } else {
      test('locationInfoWeb', () {
        print('locationInfoWeb: $locationInfoWeb');
      });
    }
  });
}
