// Copyright (c) 2016, Alexandre Roux Tekartik. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

// ignore_for_file: deprecated_member_use_from_same_package

import 'package:tekartik_app_utils/splash/splash.dart';
import 'package:tekartik_common_utils/common_utils_import.dart';

Future main() async {
  splash.init(msTimeout: 1000);
  await sleep(10000);

  await splash.hide();
}
